import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Flexible(
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromRGBO(50, 50, 50, 1),
              gap: 8,
              padding: const EdgeInsets.all(16),
              selectedIndex: selectedIndex,
              tabs: const [
                GButton(
                  icon: Icons.camera_alt_outlined,
                  text: 'Food AR',
                  textStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                GButton(
                  icon: Icons.history_rounded,
                  text: 'History',
                  textStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                GButton(icon: Icons.home),
                GButton(
                  icon: Icons.map_sharp,
                  text: 'Nearby\n News',
                  textStyle: TextStyle(
                      fontSize: 9.2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  textStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
              onTabChange: onTabChange,
            ),
          ),
        ],
      ),
    );
  }
}
