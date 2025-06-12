import 'package:flutter/material.dart';

class BuscomfySplashScreen extends StatelessWidget {
  const BuscomfySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigate to onboarding when tapped
          Navigator.pushReplacementNamed(context, '/onboarding');
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF97316), Color(0xFFEA580C)],
            ),
          ),
          child: Center(
            child: Container(
              width: 400,
              height: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2Fa353560963de4121ab0b9d86f096f4db",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Tap to continue",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
