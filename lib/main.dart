import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kta/pages/onboarding_page.dart';
import 'package:kta/pages/web_home.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget home;
    if (kIsWeb) {
      // Show OnBoardingPage for mobile platforms
      home = const OnBoardingPage();
    } else {
      // Show WebPage for web platform
      home = const OnBoardingPage();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home,
    );
  }
}
