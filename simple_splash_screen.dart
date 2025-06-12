import 'package:flutter/material.dart';

class BuscomfySplashScreen extends StatelessWidget {
  const BuscomfySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF97316), // Orange
              Color(0xFFEA580C), // Darker orange
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 550,
            constraints: BoxConstraints(maxWidth: 448),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.orange,
            ),
            child: Stack(
              children: [
                // Background image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2Fa353560963de4121ab0b9d86f096f4db",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Text at bottom
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Tap to continue",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
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
