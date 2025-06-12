// Create this file: lib/screens/splash_screen.dart
// Paste your Builder.io Flutter code here

// Your Builder.io code should look something like:

import 'package:flutter/material.dart';

class BuscomfySplashScreen extends StatelessWidget {
  final VoidCallback? onTap;
  final String appName;

  const BuscomfySplashScreen({
    super.key,
    this.onTap,
    this.appName = "Buscomfy+",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: onTap,
        child: Container(
          // Your Builder.io generated code will go here
          // with all the gradient backgrounds and styling
        ),
      ),
    );
  }
}
