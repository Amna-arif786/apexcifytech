import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apexcify Technologies User Profile',
      theme: ThemeData(
        primaryColor: const Color(0xFF13ECDA),
        scaffoldBackgroundColor: const Color(0xFFF6F8F8),
        fontFamily: 'Inter',
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xFF13ECDA),
        scaffoldBackgroundColor: const Color(0xFF102220),
        brightness: Brightness.dark,
        fontFamily: 'Inter',
      ),
      home: const SplashScreen(), // Start with splash screen
    );
  }
}