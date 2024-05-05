import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp/profile/about.dart';
import 'package:fyp/profile/allergies.dart';
import 'package:fyp/login/sign/login.dart';
import 'package:fyp/profile_menu.dart';
import 'package:fyp/profile/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  final Map<String, dynamic>? userData;
  const Profile({Key? key, this.userData}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? _selectedImage;
  late String _name;
  late String _email;

  @override
  void initState() {
    super.initState();
    // Fetch user data when the widget is first created
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();

      setState(() {
        _name = userData['name'];
        _email = user.email ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile',
            style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _selectImage,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: _selectedImage != null
                        ? Image.file(File(_selectedImage!.path))
                        : widget.userData?['imgUrl'] != null &&
                                widget.userData!['imgUrl'] != ""
                            ? Image.network(widget.userData!['imgUrl'])
                            : Image.asset("assets/profile.jpg"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _name ?? 'Name',
                style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                _email ?? 'Email',
                style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    // Navigate to the Setting screen and wait for result
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Setting(),
                      ),
                    );
                    // After returning from the Setting screen, refresh the user data
                    fetchUserData();
                  },
                  child: Text("Edit Profile",
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "Allergies",
                icon: Icons.food_bank_rounded,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Allergies()),
                  );
                },
              ),
              ProfileMenuWidget(
                title: "About",
                icon: Icons.info_rounded,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout_rounded,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectImage() async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = pickedImage;
        });

        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Upload the selected image to Firestore
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .update({'imgUrl': pickedImage.path});
        }
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }
}
