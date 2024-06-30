import 'dart:async';
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screens/food_ar.dart';
import 'package:fyp/screens/history.dart';
import 'package:fyp/screens/nearby_news.dart';
import 'package:fyp/screens/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen2 extends StatefulWidget {
  final Map<String, dynamic>? userData;

  const HomeScreen2({Key? key, this.userData}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int _currentIndex = 0;
  late Timer _timer;
  bool _isCarouselInteracting = false;

  final List<String> _backgrounds = [
    'assets/bg2.jpg',
    'assets/bg3.jpg',
    'assets/bg4.jpg',
  ];
  List<Map<String, dynamic>> recentHistory = [];
  @override
  void initState() {
    super.initState();
    _startTimer();
    fetchRecentHistory();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!_isCarouselInteracting) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _backgrounds.length;
        });
      }
    });
  }

  String _extractTimestamp(String timestamp) {
    // Assuming timestamp is in milliseconds since epoch
    int millisecondsSinceEpoch = int.tryParse(timestamp) ?? 0;
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
        .toString();
  }

  Future<List<Map<String, dynamic>>> fetchRecentHistory() async {
    final ListResult result =
        await FirebaseStorage.instance.ref('History').listAll();
    final items = result.items;

    List<Map<String, dynamic>> fetchedHistory = [];

    for (final item in items.reversed) {
      final String timestamp = item.name.split('.').first;
      final String extension = item.name.split('.').last;

      if (extension == 'txt') {
        final textData = await item.getData();
        if (textData != null) {
          final prediction = utf8.decode(textData);
          final topic = _extractTopic(prediction);
          final predictedItem = _extractPrediction(prediction);
          final imageUrl = _getImageUrl(predictedItem);

          fetchedHistory.add({
            'timestamp': timestamp,
            'prediction': predictedItem,
            'topic': topic,
            'imageUrl': imageUrl,
          });
        }
      }

      if (fetchedHistory.length >= 5) {
        break; // Stop iterating once we have 5 items
      }
    }

    setState(() {
      recentHistory = fetchedHistory;
    });

    return fetchedHistory;
  }

  String _extractTopic(String predictionText) {
    final lines = predictionText.split('\n');
    final topicLine = lines.firstWhere(
      (line) => line.startsWith('Spotted:'),
      orElse: () => '',
    );
    return topicLine.isNotEmpty ? topicLine.split(':').last.trim() : '';
  }

  String _extractPrediction(String predictionText) {
    final lines = predictionText.split('\n');
    final predictionLine = lines.firstWhere(
      (line) => line.startsWith('Prediction:'),
      orElse: () => '',
    );
    return predictionLine.isNotEmpty
        ? predictionLine.split(':').last.trim()
        : '';
  }

  String _getImageUrl(String predictedItem) {
    // Map predicted items to their corresponding image URLs
    Map<String, String> imageUrls = {
      'Fresh Apples': 'assets/freshapples.png',
      'Rotten Apples': 'assets/rottenapples.png',
      'Fresh Banana': 'assets/freshbanana.png',
      'Rotten Banana': 'assets/rottenbanana.png',
      'Fresh Carrot': 'assets/freshcarrot.png',
      'Rotten Carrot': 'assets/rottencarrot.png',
      'Fresh Tomato': 'assets/freshtomato.png',
      'Rotten Tomato': 'assets/rottentomato.png',
      'Fresh Oranges': 'assets/freshoranges.png',
      'Rotten Oranges': 'assets/rottenoranges.png',
    };

    return imageUrls[predictedItem.toLowerCase()] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/iconWord.png',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Listener(
              onPointerDown: (_) {
                setState(() {
                  _isCarouselInteracting = true;
                });
              },
              onPointerUp: (_) {
                setState(() {
                  _isCarouselInteracting = false;
                });
              },
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: _backgrounds.asMap().entries.map((entry) {
                  int index = entry.key;
                  String image = entry.value;

                  String text = '';
                  switch (index) {
                    case 0:
                      text = "Let's Spot some Food!";
                      break;
                    case 1:
                      text =
                          "Have you done setting up your Profile?\nRemember to Set it Up";
                      break;
                    case 2:
                      text =
                          "Did you meet some Food Related Cases?\nNo worries, Let us help you with that.";
                      break;
                    default:
                      text = '';
                  }

                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              text,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                if (_currentIndex == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FoodAR(),
                                    ),
                                  );
                                } else if (_currentIndex == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Profile(),
                                    ),
                                  );
                                } else if (_currentIndex == 2) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NearbyNews(),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Go',
                                style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Spotting',
                    style: GoogleFonts.ubuntu(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const History(),
                        ),
                      );
                    },
                    child: Text(
                      'View More',
                      style: GoogleFonts.ubuntu(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: Future.value(recentHistory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final recentHistory = snapshot.data as List<
                        Map<String,
                            dynamic>>; // Cast the snapshot data to the correct type

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentHistory.length,
                      itemBuilder: (context, index) {
                        final data = recentHistory[index];
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  data['prediction'] ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 8),
                                      Text(
                                          '${timeago.format(DateTime.parse(_extractTimestamp(data['timestamp'])))}'),
                                      if (data['imageUrl'].isNotEmpty)
                                        Image.asset(data['imageUrl']!),
                                      if (data['prediction']
                                          .toString()
                                          .toLowerCase()
                                          .contains('fresh'))
                                        const Text(
                                          'You are safe to consume!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      if (data['prediction']
                                          .toString()
                                          .toLowerCase()
                                          .contains('rotten'))
                                        const Text(
                                          'Please do not consume!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      // Add more conditions for displaying nutrition information
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: SizedBox(
                              width: 150,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/${data['prediction'].toString().toLowerCase().replaceAll(' ', '')}.png',
                                      height:
                                          100, // Adjust the height as needed
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Spotted: ${data['prediction']}',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
