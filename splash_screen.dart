import 'package:flutter/material.dart';

class BuscomfySplashScreen extends StatefulWidget {
  final VoidCallback? onTap;
  final String appName;
  final bool autoAdvance;
  final int delay;

  const BuscomfySplashScreen({
    super.key,
    this.onTap,
    this.appName = "Buscomfy+",
    this.autoAdvance = false,
    this.delay = 3000,
  });

  @override
  State<BuscomfySplashScreen> createState() => _BuscomfySplashScreenState();
}

class _BuscomfySplashScreenState extends State<BuscomfySplashScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.autoAdvance && widget.onTap != null) {
      Future.delayed(Duration(milliseconds: widget.delay), () {
        if (mounted) {
          widget.onTap!();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 640;

    return Scaffold(
      body: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF97316), // orange-500
                Color(0xFFEA580C), // orange-600
              ],
            ),
          ),
          child: SafeArea(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    children: [
                      // Background layer
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF7960F), // from-[#F7960F]
                                Color(0xFFFF8C00), // to-[#FF8C00]
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Mobile background image overlay
                      if (isMobile)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2Fa353560963de4121ab0b9d86f096f4db",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                      // Content layer
                      Positioned.fill(
                        child: Container(
                          child: Stack(
                            children: [
                              // Main content area (currently empty as per your design)
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Add your bus icon/logo here when needed
                                    // SizedBox(height: 24),
                                    // Text(
                                    //   widget.appName,
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 24,
                                    //     fontWeight: FontWeight.bold,
                                    //     letterSpacing: 0.6,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),

                              // Tap to continue text
                              if (widget.onTap != null && !widget.autoAdvance)
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
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Usage in main.dart:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscomfy+',
      theme: ThemeData(fontFamily: 'Inter', primarySwatch: Colors.orange),
      home: BuscomfySplashScreen(
        onTap: () {
          // Navigate to next screen
          Navigator.of(context).pushReplacementNamed('/onboarding');
        },
      ),
    );
  }
}
