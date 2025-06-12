import 'package:flutter/material.dart';

class BuscomfySplashScreen extends StatelessWidget {
  final VoidCallback? onTap;

  const BuscomfySplashScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://2ac212472ec64c4582e1703c57c9c27f-b99b23cf3e5141f3b8ba63a73.fly.dev/orange-bg.svg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: screenWidth * 0.9,
              height: 550,
              constraints: BoxConstraints(maxWidth: 448),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF97316), // orange-500
                    Color(0xFFEA580C), // orange-600
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Builder.io background image
                  Positioned.fill(
                    child: Container(
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
                  ),

                  // Tap to continue text
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
                          fontWeight: FontWeight.w400,
                        ),
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
