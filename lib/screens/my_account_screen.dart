import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class MyAccountScreen extends StatelessWidget {
  // Demo user info - in a real app this would come from user context/API
  final Map<String, String> userInfo = {
    'name': 'Dinesh VG',
    'phone': '7598113129',
    'avatar':
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
  };

  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://2ac212472ec64c4582e1703c57c9c27f-b99b23cf3e5141f3b8ba63a73.fly.dev/orange-bg.svg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 448),
              height: 650,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                fontFamily: 'Inter',
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      // Header section with background image
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2F6ee3345d560641f1bc37df16062b7293",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                        child: Column(
                          children: [
                            // Header with back button and title
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text(
                                  'My Account',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 24),

                            // User profile section
                            Row(
                              children: [
                                // User avatar
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Image.network(
                                      userInfo['avatar']!,
                                      fit: BoxFit.cover,
                                      width: 64,
                                      height: 64,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 16),

                                // User info
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userInfo['name']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        height: 1.4,
                                      ),
                                    ),
                                    Text(
                                      userInfo['phone']!,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        height: 1.56,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Main content area
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          transform: Matrix4.translationValues(0, -16, 0),
                          padding: EdgeInsets.fromLTRB(24, 24, 24, 96),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Personalize section
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personalize',
                                    style: TextStyle(
                                      color: Color(0xFF111827),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      height: 1.56,
                                    ),
                                  ),
                                  SizedBox(height: 16),

                                  // Personal Info menu item
                                  _buildMenuItem(
                                    context,
                                    icon: Icons.person_outline,
                                    title: 'Personal Info',
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/personal-info',
                                      );
                                    },
                                  ),

                                  // Change Password menu item
                                  _buildMenuItem(
                                    context,
                                    icon: Icons.lock_outline,
                                    title: 'Change Password',
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/forgot-password',
                                      );
                                    },
                                  ),

                                  // Notification Preferences menu item
                                  _buildMenuItem(
                                    context,
                                    icon: Icons.notifications_outlined,
                                    title: 'Notification Preferences',
                                    onTap: () {
                                      // Navigate to notifications
                                      print('Navigate to notifications');
                                    },
                                  ),

                                  // Privacy Settings menu item
                                  _buildMenuItem(
                                    context,
                                    icon: Icons.privacy_tip_outlined,
                                    title: 'Privacy Settings',
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/help-center',
                                      );
                                    },
                                  ),

                                  // Logout menu item
                                  _buildMenuItem(
                                    context,
                                    icon: Icons.logout,
                                    title: 'Logout',
                                    onTap: () {
                                      _showLogoutDialog(context);
                                    },
                                    isDestructive: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Bottom Navigation
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomBottomNavigationBar(
                      currentRoute: '/my-account',
                      onNavItemTap: (route) {
                        if (route != '/my-account') {
                          Navigator.pushReplacementNamed(context, route);
                        }
                      },
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

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon and title
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: isDestructive
                            ? Color(0xFFDC2626)
                            : Color(0xFF4B5563),
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Text(
                        title,
                        style: TextStyle(
                          color: isDestructive
                              ? Color(0xFFDC2626)
                              : Color(0xFF111827),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Chevron right arrow
                Icon(Icons.chevron_right, color: Color(0xFF9CA3AF), size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Color(0xFF6B7280))),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to login screen
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              child: Text('Logout', style: TextStyle(color: Color(0xFFDC2626))),
            ),
          ],
        );
      },
    );
  }
}
