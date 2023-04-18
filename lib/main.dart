import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:kta/pages/splash_pages.dart';
import 'package:kta/pages/web_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const Widget _currentPage = _getCurrentPage();
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _currentPage,
    );
  }

  Widget _getCurrentPage() {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return const SplashPage();
    } else {
      return const web_home();
    }
  }
}
