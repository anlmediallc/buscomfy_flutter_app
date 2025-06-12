import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 448),
              height: 650,
              decoration: BoxDecoration(
                color: Colors.white,
                fontFamily: 'Inter',
              ),
              child: Stack(
                children: [
                  Column(
                children: [
                  // Status bar
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFF7960F), // rgb(247, 150, 15)
                          Color(0xFFFF8C00), // rgb(255, 140, 0)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '9:41',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            // Signal strength indicators
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 4,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 4,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 4,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            // WiFi icon
                            Icon(
                              Icons.wifi,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            // Battery indicator
                            Container(
                              width: 24,
                              height: 12,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 16,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Header with back button and title
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFF7960F), // rgb(247, 150, 15)
                          Color(0xFFFF8C00), // rgb(255, 140, 0)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
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
                          'Trip Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Main content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 80),
                      child: Column(
                        children: [
                          // Transport company section
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFF3F4F6),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                // Company info row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // Company logo
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'MSS',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          'MSS transport',
                                          style: TextStyle(
                                            color: Color(0xFF111827),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // External link button
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1F2937),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Icon(
                                        Icons.open_in_new,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 16),

                                // Route information
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Departure info
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '7:30',
                                          style: TextStyle(
                                            color: Color(0xFF111827),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'AM',
                                          style: TextStyle(
                                            color: Color(0xFF6B7280),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Chennai',
                                          style: TextStyle(
                                            color: Color(0xFF374151),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Route visualization
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 16),
                                        child: Column(
                                          children: [
                                            // Duration and distance info
                                            Column(
                                              children: [
                                                Text(
                                                  '5h 30m',
                                                  style: TextStyle(
                                                    color: Color(0xFF6B7280),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  '350km',
                                                  style: TextStyle(
                                                    color: Color(0xFF6B7280),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            // Route line with dots
                                            Row(
                                              children: [
                                                Container(
                                                  width: 8,
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF97316),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 2,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFE5E7EB),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 8,
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF97316),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // Arrival info
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1:00',
                                          style: TextStyle(
                                            color: Color(0xFF111827),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'PM',
                                          style: TextStyle(
                                            color: Color(0xFF6B7280),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Bangalore',
                                          style: TextStyle(
                                            color: Color(0xFF374151),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Trip information cards
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                // Date and passenger info
                                _buildInfoCard(
                                  icon: Icons.calendar_today,
                                  title: 'Travel Date',
                                  subtitle: 'Tomorrow, March 15, 2024',
                                ),
                                SizedBox(height: 12),
                                _buildInfoCard(
                                  icon: Icons.person,
                                  title: 'Passenger',
                                  subtitle: '1 Adult',
                                ),
                                SizedBox(height: 12),
                                _buildInfoCard(
                                  icon: Icons.event_seat,
                                  title: 'Seat Number',
                                  subtitle: 'A12',
                                ),
                                SizedBox(height: 12),
                                _buildInfoCard(
                                  icon: Icons.confirmation_number,
                                  title: 'Ticket ID',
                                  subtitle: 'BF123456789',
                                ),
                              ],
                            ),
                          ),

                          // Action buttons
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Column(
                              children: [
                                // View Stops button
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  margin: EdgeInsets.only(bottom: 12),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/trip-stops');
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Color(0xFFF97316)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'View Stops',
                                      style: TextStyle(
                                        color: Color(0xFFF97316),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),

                                // Download Ticket button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _handleDownloadTicket(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFF7960F), // rgb(247, 150, 15)
                                            Color(0xFFFF8C00), // rgb(255, 140, 0)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Download Ticket',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                      currentRoute: '/trip-details',
                      onNavItemTap: (route) {
                        if (route != '/trip-details') {
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
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF97316).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              color: Color(0xFFF97316),
              size: 16,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleDownloadTicket(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Ticket downloaded successfully!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
