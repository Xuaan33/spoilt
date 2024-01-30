import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2; // Set the index of the home icon
  DateTime? lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onWillPop();
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromRGBO(50, 50, 50, 1),
              gap: 8,
              padding: EdgeInsets.all(16),
              selectedIndex: selectedIndex, // Set the selectedIndex
              tabs: const [
                GButton(
                  icon: Icons.camera_alt_outlined,
                  text: 'Food AR',
                ),
                GButton(
                  icon: Icons.history_rounded,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.home,
                ),
                GButton(icon: Icons.map_sharp, text: 'Nearby News'),
                GButton(icon: Icons.person, text: 'Profile'),
              ],
              onTabChange: (index) {
                setState(() {
                  selectedIndex =
                      index; // Update the selectedIndex when tab changes
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (lastBackPressTime == null ||
        now.difference(lastBackPressTime!) > Duration(seconds: 2)) {
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
