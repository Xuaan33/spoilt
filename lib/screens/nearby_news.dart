import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NearbyNews extends StatefulWidget {
  const NearbyNews({super.key});

  @override
  State<NearbyNews> createState() => _NearbyNewsState();
}

class _NearbyNewsState extends State<NearbyNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fyp"),
      ),
      body: const Center(
        child: Text("Welcome to Nearby News"),
      ),
    );
  }
}
