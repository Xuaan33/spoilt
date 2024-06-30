import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:flutter/services.dart';

List<CameraDescription>? cameras;

class FoodAR extends StatefulWidget {
  final Map<String, dynamic>? userData;
  const FoodAR({Key? key, this.userData}) : super(key: key);

  @override
  State<FoodAR> createState() => _FoodARState();
}

class _FoodARState extends State<FoodAR> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  bool isCapturing = false;
  late User _currentUser;

  @override
  void initState() {
    super.initState();
    loadModel();
    loadCamera();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    _currentUser = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _scaffoldKey,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                        aspectRatio: cameraController!.value.aspectRatio,
                        child: CameraPreview(cameraController!),
                      ),
              ),
            ),
            Text(
              output,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isCapturing)
                    Text("Predicting in ${_countdown.toString()}..."),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCapturing = true;
                      });
                      _startCountdown();
                    },
                    child: Text("SPOT"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    await cameraController!.initialize();
    if (mounted) {
      setState(() {});
    }
    cameraController!.startImageStream((imageStream) {
      if (isCapturing) {
        cameraImage = imageStream;
        runModel();
      }
    });
  }

  Future<void> runModel() async {
    if (cameraImage != null) {
      var prediction = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 1,
        threshold: 0.1,
        asynch: true,
      );
      if (prediction != null && prediction.isNotEmpty) {
        setState(() {
          output = prediction[0]['label'];
        });
        // Send prediction to Unity
        //sendPredictionToUnity(output);
      }
    }
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  int _countdown = 3;

  Future<void> _startCountdown() async {
    for (int i = 3; i > 0; i--) {
      setState(() {
        _countdown = i;
      });
      await Future.delayed(Duration(seconds: 1));
    }
    await Future.wait([
      savePrediction(output),
    ]);
    setState(() {
      isCapturing = false;
      output = ''; // Reset the isCapturing flag after saving the prediction
    });
  }

  Future<void> savePrediction(String prediction) async {
    try {
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('History')
          .child('$timestamp.txt');
      await storageReference.putData(utf8.encode(
          'Prediction: $prediction\nUserID: ${_currentUser.uid}\nTimestamp: $timestamp'));
      print('Prediction saved successfully.');
    } catch (e) {
      print('Error saving prediction: $e');
    }
  }

  // Future<void> savePrediction(String prediction) async {
  //   try {
  //     final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  //     final String userId = _currentUser.uid;
  //     final String fileName = '$timestamp.txt';
  //     final String filePath =
  //         'History/$userId/$fileName'; // Specify the full path including user ID
  //     final Reference storageReference =
  //         FirebaseStorage.instance.ref().child(filePath);

  //     await storageReference.putData(utf8.encode(
  //         'Prediction: $prediction\nUserID: $userId\nTimestamp: $timestamp'));
  //     print('Prediction saved successfully.');
  //   } catch (e) {
  //     print('Error saving prediction: $e');
  //   }
  // }

  // // Define a method channel
  // static const platform = MethodChannel('com.example.flutterunitywidget');

  // // Method to send prediction to Unity
  // Future<void> sendPredictionToUnity(String prediction) async {
  //   try {
  //     await platform.invokeMethod('sendPrediction', {'prediction': prediction});
  //   } catch (e) {
  //     print('Error sending prediction to Unity: $e');
  //   }
  // }
}
