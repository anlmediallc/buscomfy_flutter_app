import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const BuscomfyApp());
}

class BuscomfyApp extends StatelessWidget {
  const BuscomfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscomfy+',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Inter'),
      home: const BuscomfySplashScreen(
        onTap: () {
          print('Splash screen tapped!');
          // Add navigation here later
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
