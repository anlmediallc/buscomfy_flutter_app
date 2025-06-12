import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Your Builder.io generated file

void main() {
  runApp(const BuscomfyApp());
}

class BuscomfyApp extends StatelessWidget {
  const BuscomfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscomfy+',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Your Builder.io component
      debugShowCheckedModeBanner: false,
    );
  }
}
