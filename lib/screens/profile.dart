import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fyp"),
      ),
      body: const Center(
        child: Text("Welcome to Profile"),
      ),
    );
  }
}
