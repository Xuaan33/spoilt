import 'package:flutter/material.dart';

class FoodAR extends StatefulWidget {
  const FoodAR({super.key});

  @override
  State<FoodAR> createState() => _FoodARState();
}

class _FoodARState extends State<FoodAR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fyp"),
      ),
      body: const Center(
        child: Text("Welcome to Food AR"),
      ),
    );
  }
}
