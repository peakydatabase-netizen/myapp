import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const PeakyApp());
}

class PeakyApp extends StatelessWidget {
  const PeakyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peaky',
      theme: ThemeData(
        brightness: Brightness.dark,
        // Yahan tera PeakyFont default font ban gaya hai
        fontFamily: 'PeakyFont', 
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 second ka wait phir next screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'P E A K Y',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
            letterSpacing: 12,
            // Specifically font family yahan bhi de sakte hain
            fontFamily: 'PeakyFont', 
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (dumbbell_bg.png)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/dumbbell_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark Overlay taaki text saaf dikhe
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          // Bottom UI (arrow_up.png)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/arrow_up.png', 
                  width: 35, 
                  height: 35, 
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                const Text(
                  'SWIPE UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
