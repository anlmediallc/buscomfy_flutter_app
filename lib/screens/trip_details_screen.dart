import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 448),
              height: 650,
              child: Stack(
                children: [
                  Column(
                    children: [
                      _buildStatusBar(),
                      _buildHeader(context),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: 80),
                          child: Column(
                            children: [
                              _buildCompanyInfoSection(),
                              _buildTripDetailsSection(),
                              _buildActionButtons(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF7960F), Color(0xFFFF8C00)],
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
              fontFamily: 'Inter',
            ),
          ),
          Row(
            children: [
              Row(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Container(
                      width: 4,
                      height: 12,
                      decoration: BoxDecoration(
                        color: index < 3 ? Colors.white : Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
              Icon(Icons.wifi, color: Colors.white, size: 16),
              SizedBox(width: 4),
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
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF7960F), Color(0xFFFF8C00)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 24),
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
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyInfoSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('MSS', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Inter')),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('MSS transport', style: TextStyle(color: Color(0xFF111827), fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Inter')),
                ],
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(20)),
                child: Icon(Icons.open_in_new, color: Colors.white, size: 12),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeInfo('7:30', 'AM', 'Chennai'),
              _buildRouteTimeline(),
              _buildTimeInfo('1:00', 'PM', 'Bangalore'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo(String time, String period, String city) {
    return Column(
      children: [
        Text(time, style: TextStyle(color: Color(0xFF111827), fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Inter')),
        Text(period, style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Inter')),
        SizedBox(height: 4),
        Text(city, style: TextStyle(color: Color(0xFF374151), fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Inter')),
      ],
    );
  }

  Widget _buildRouteTimeline() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Column(
              children: [
                Text('5h 30m', style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Inter')),
                Text('350km', style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Inter')),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(backgroundColor: Color(0xFFF97316), radius: 4),
                Expanded(child: Divider(thickness: 2, color: Color(0xFFE5E7EB))...),
                CircleAvatar(backgroundColor: Color(0xFFF97316), radius: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripDetailsSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildInfoCard(icon: Icons.calendar_today, title: 'Travel Date', subtitle: 'Tomorrow, March 15, 2024'),
          SizedBox(height: 12),
          _buildInfoCard(icon: Icons.person, title: 'Passenger', subtitle: '1 Adult'),
          SizedBox(height: 12),
          _buildInfoCard(icon: Icons.event_seat, title: 'Seat Number', subtitle: 'A12'),
          SizedBox(height: 12),
          _buildInfoCard(icon: Icons.confirmation_number, title: 'Ticket ID', subtitle: 'BF123456789'),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/trip-stops'),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFFF97316)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('View Stops', style: TextStyle(color: Color(0xFFF97316), fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Inter')),
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => _handleDownloadTicket(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFFF7960F), Color(0xFFFF8C00)], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text('Download Ticket', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Inter')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String subtitle}) {
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
            decoration: BoxDecoration(color: Color(0xFFF97316).withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
            child: Icon(icon, color: Color(0xFFF97316), size: 16),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Color(0xFF6B7280), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Inter')),
              Text(subtitle, style: TextStyle(color: Color(0xFF111827), fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Inter')),
            ],
          ),
        ],
      ),
    );
  }

  void _handleDownloadTicket(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ticket downloaded successfully!', style: TextStyle(color: Colors.white, fontFamily: 'Inter')),
        backgroundColor: Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
