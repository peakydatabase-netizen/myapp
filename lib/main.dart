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
      title: 'Peaky', // App ka display name
      theme: ThemeData(brightness: Brightness.dark),
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
    // 3 second baad welcome screen par jayega
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
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
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
                colors: [Colors.black.withOpacity(0.3), Colors.black.withOpacity(0.9)],
              ),
            ),
          ),
          // Swipe Up UI
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset('assets/images/arrow_up.png', width: 40, height: 40, color: Colors.white),
                const SizedBox(height: 10),
                const Text('SWIPE UP', style: TextStyle(color: Colors.white, letterSpacing: 2)),
              ],
            ),
          ),
        ],
      ),
    )
      ;
  }
}
