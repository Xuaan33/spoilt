import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/home_screen.dart';
import 'package:fyp/login/sign/login.dart';
import 'package:fyp/login/sign/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LogIn(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 26, 59, 13),
            Color.fromARGB(255, 255, 241, 112)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo1.png',
              width: 270,
              height: 270,
            ),
            const SizedBox(height: 5),
            Text(
              'SPOILT',
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Sedap Journey, Safe Bites',
              style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
