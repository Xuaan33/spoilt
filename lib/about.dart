import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About App'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App Name: Spoilt',
              style: GoogleFonts.ubuntu(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Version: 1.0.0',
              style: GoogleFonts.ubuntu(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: GoogleFonts.ubuntu(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Spoilt is an app designed to help you keep track of the freshness of your food items. '
              'It uses AI to predict the freshness of fruits and vegetables based on images captured '
              'by your device\'s camera. With Spoilt, you can reduce food waste and ensure that you '
              'consume only the freshest food.',
              style: GoogleFonts.ubuntu(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Developed By:',
              style: GoogleFonts.ubuntu(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nicholas Ngiam Li Xuan',
              style: GoogleFonts.ubuntu(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us:',
              style: GoogleFonts.ubuntu(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: nic110397@gmail.com',
              style: GoogleFonts.ubuntu(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
