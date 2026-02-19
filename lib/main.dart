import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math; // Rotation ke liye ye zaroori hai

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
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/dumbbell_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark Overlay
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
          // Bottom UI
          Positioned(
            bottom: 50, // Thoda aur upar kiya taaki saaf dikhe
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Arrow ko -90 degree rotate kiya
                Transform.rotate(
                  angle: -math.pi / 2, 
                  child: Image.asset(
                    'assets/images/arrow_up.png',
                    width: 35,
                    height: 35,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15), // Spacing badhai
                // Naya Text
                const Text(
                  'Swipe Up To Login Your Peaky App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16, // Font size thoda badhaya
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500,
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
