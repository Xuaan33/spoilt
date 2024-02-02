import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/bottom_nav_bar.dart';
import 'package:fyp/screens/food_ar.dart';
import 'package:fyp/screens/history.dart';
import 'package:fyp/screens/home_screen2.dart';
import 'package:fyp/screens/nearby_news.dart';
import 'package:fyp/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;
  DateTime? lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onWillPop();
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        body: _buildBody(), // Add the body of your HomeScreen
      ),
    );
  }

  Widget _buildBody() {
    // Implement the body of your HomeScreen here
    // You can use IndexedStack or Navigator to switch between screens based on the selectedIndex
    // Example:
    switch (selectedIndex) {
      case 0:
        return FoodAR();
      case 1:
        return History();
      case 2:
        return HomeScreen2();
      case 3:
        return NearbyNews();
      case 4:
        return Profile();
      default:
        return HomeScreen2(); // Default case
    }
  }

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (lastBackPressTime == null ||
        now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
      lastBackPressTime = now;
      _showToast("Press again to exit");
      return false;
    } else {
      Fluttertoast.cancel(); // Cancel any existing toasts
      Fluttertoast.showToast(
        msg: "Exiting the application",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // Exit the whole application
      exit(0);
      return true;
    }
  }

  void _showToast(String message) {
    Fluttertoast.cancel(); // Cancel any existing toasts
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
