// Replace your lib/main.dart with this:

import 'package:flutter/material.dart';
// Import your exported splash screen here
// import 'screens/splash_screen.dart';

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
      // Replace this with your exported SplashScreen widget
      home: const Scaffold(
        body: Center(child: Text('Replace with your exported splash screen')),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Steps after copying Builder.io code:
// 1. Create lib/screens/ folder
// 2. Create splash_screen.dart in that folder
// 3. Paste your Builder.io generated code there
// 4. Import it here: import 'screens/splash_screen.dart';
// 5. Replace the home: Scaffold(...) with home: SplashScreen(),
