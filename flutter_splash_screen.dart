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
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // Background gradient
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF7960F), // from-[#F7960F]
                Color(0xFFFF8C00), // to-[#FF8C00]
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
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
                    // Background image for mobile
                    if (MediaQuery.of(context).size.width <= 640)
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

                    // Content
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Your app icon would go here
                          // Add your bus icon/logo component
                          SizedBox(height: 24),

                          // App name
                          Text(
                            appName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Tap to continue
                    if (onTap != null)
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
      ),
    );
  }
}

// Usage example:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscomfy+',
      home: BuscomfySplashScreen(
        onTap: () {
          // Navigate to next screen
          print("Splash screen tapped!");
        },
      ),
    );
  }
}
