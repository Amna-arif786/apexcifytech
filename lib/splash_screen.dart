import 'dart:async';

import 'package:apexcifytech/profile_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _controller.forward();

    // Navigate to home screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const UserProfileScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17B8AC),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Apexcify colorful text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ColoredLetter('A', const Color(0xFFFDD835)),
                    _ColoredLetter('p', const Color(0xFFD4E157)),
                    _ColoredLetter('e', const Color(0xFF66E6D6)),
                    _ColoredLetter('x', const Color(0xFF4DD0E1)),
                    _ColoredLetter('c', const Color(0xFF9575CD)),
                    _ColoredLetter('i', const Color(0xFFEC407A)),
                    _ColoredLetter('f', const Color(0xFFEC407A)),
                    _ColoredLetter('y', const Color(0xFFEC407A)),
                  ],
                ),
                const SizedBox(height: 8),
                // Technologies text
                const Text(
                  'Technologies',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ColoredLetter extends StatelessWidget {
  final String letter;
  final Color color;

  const _ColoredLetter(this.letter, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      letter,
      style: TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: color,
        height: 1.0,
      ),
    );
  }
}

// TODO Implement this library.