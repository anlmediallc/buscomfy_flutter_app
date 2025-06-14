import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class TripStopsScreen extends StatelessWidget {
  const TripStopsScreen({super.key});

  final List<Map<String, dynamic>> stops = const [
    {
      'time': '7:30',
      'period': 'AM',
      'location': 'Chennai Central',
      'type': 'departure',
      'duration': null,
      'status': 'completed',
    },
    {
      'time': '9:15',
      'period': 'AM',
      'location': 'Vellore',
      'type': 'stop',
      'duration': '10 min',
      'status': 'completed',
    },
    {
      'time': '10:45',
      'period': 'AM',
      'location': 'Krishnagiri',
      'type': 'stop',
      'duration': '15 min',
      'status': 'current',
    },
    {
      'time': '12:30',
      'period': 'PM',
      'location': 'Hosur',
      'type': 'stop',
      'duration': '10 min',
      'status': 'upcoming',
    },
    {
      'time': '1:00',
      'period': 'PM',
      'location': 'Bangalore City',
      'type': 'arrival',
      'duration': null,
      'status': 'upcoming',
    },
  ];

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
                              _buildCompanySection(),
                              _buildStopsTimeline(),
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
                      currentRoute: '/trip-stops',
                      onNavItemTap: (route) {
                        if (route != '/trip-stops') {
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
                        color: index < 3
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
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

  Widget _buildCompanySection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Row(
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
                  child: Text(
                    'MSS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
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
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xFF1F2937),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.open_in_new, color: Colors.white, size: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildStopsTimeline() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Route Timeline',
            style: TextStyle(
              color: Color(0xFF111827),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 16),
          ...stops.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> stop = entry.value;
            bool isLast = index == stops.length - 1;
            return _buildTimelineItem(stop, isLast);
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(Map<String, dynamic> stop, bool isLast) {
    Color getStatusColor(String status) {
      switch (status) {
        case 'completed':
          return Color(0xFF10B981);
        case 'current':
          return Color(0xFFF97316);
        case 'upcoming':
        default:
          return Color(0xFFE5E7EB);
      }
    }

    IconData getStopIcon(String type) {
      switch (type) {
        case 'departure':
          return Icons.play_circle_outline;
        case 'arrival':
          return Icons.flag_outlined;
        default:
          return Icons.location_on_outlined;
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  stop['time'],
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  stop['period'],
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: getStatusColor(stop['status']),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(
                    getStopIcon(stop['type']),
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(color: Color(0xFFE5E7EB)),
                ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stop['location'],
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 4),
                if (stop['duration'] != null)
                  Text(
                    'Stop duration: ${stop['duration']}',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),
                if (stop['type'] == 'departure')
                  Text(
                    'Departure point',
                    style: TextStyle(
                      color: Color(0xFF10B981),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                if (stop['type'] == 'arrival')
                  Text(
                    'Final destination',
                    style: TextStyle(
                      color: Color(0xFF10B981),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                if (stop['status'] == 'current')
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Color(0xFFF97316).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Current location',
                      style: TextStyle(
                        color: Color(0xFFF97316),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
