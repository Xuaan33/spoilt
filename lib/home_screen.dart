import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  User? _currentUser;
  Map<String, dynamic>? _userData;
  int selectedIndex = 2;
  DateTime? lastBackPressTime;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    try {
      _currentUser = FirebaseAuth.instance.currentUser;
      if (_currentUser != null) {
        _fetchUserData();
      }
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
          .instance
          .collection('Users')
          .doc(_currentUser!.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _userData = userDoc.data();
        });
      } else {
        print('User document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onWillPop();
      },
      child: Scaffold(
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  FoodAR(userData: _userData),
                  History(userData: _userData),
                  HomeScreen2(userData: _userData),
                  NearbyNews(userData: _userData),
                  Profile(userData: _userData),
                ],
              ),
            ),
            BottomNavigationBarWidget(
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (selectedIndex) {
      case 0:
        return FoodAR(
          userData: _userData,
        );
      case 1:
        return History(userData: _userData);
      case 2:
        return HomeScreen2(userData: _userData);
      case 3:
        return NearbyNews(userData: _userData);
      case 4:
        return Profile(userData: _userData);
      default:
        return HomeScreen2(userData: _userData);
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
