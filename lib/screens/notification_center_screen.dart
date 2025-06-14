import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class NotificationCenterScreen extends StatelessWidget {
  // Sample notification data
  final List<Map<String, dynamic>> notifications = const [
    {
      'icon': Icons.access_time,
      'title': 'Your bus is delayed by 15 minutes',
      'subtitle': 'MSS Transport – 20 min ago',
    },
    {
      'icon': Icons.confirmation_number_outlined,
      'title': 'Ticket booking confirmed',
      'subtitle': 'Buscomfy+ – 1 hour ago',
    },
    {
      'icon': Icons.location_on_outlined,
      'title': 'You have arrived at your destination',
      'subtitle': 'Trip completed – 2 hours ago',
    },
    {
      'icon': Icons.payment,
      'title': 'Payment successful',
      'subtitle': 'Transaction ID: #BF12345 – 3 hours ago',
    },
  ];

  const NotificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2F3e3b118899d545fe8107825676bfdf48',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 448),
              height: 650,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Column(
                    children: [
                      // Header section with background image
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2F6ee3345d560641f1bc37df16062b7293',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                                    SizedBox(width: 4),
                                    Icon(Icons.notifications, color: Colors.white, size: 20),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Notification Center',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // White content section with rounded top corners
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          transform: Matrix4.translationValues(0, -12, 0),
                          child: Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Today section
                                      const Text(
                                        'Today',
                                        style: TextStyle(
                                          color: Color(0xFF111827),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ...notifications.take(2).map(_buildNotificationItem),

                                      const SizedBox(height: 24),

                                      // Earlier section
                                      const Text(
                                        'Earlier',
                                        style: TextStyle(
                                          color: Color(0xFF111827),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ...notifications.skip(2).map(_buildNotificationItem),
                                    ],
                                  ),
                                ),
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
                      currentRoute: '/notifications',
                      onNavItemTap: (route) {
                        if (route != '/notifications') {
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

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Notification icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(notification['icon'], color: const Color(0xFF4B5563), size: 16),
                ),
                const SizedBox(width: 12),
                // Notification content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification['title'],
                        style: const TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification['subtitle'],
                        style: const TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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
