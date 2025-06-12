import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String currentRoute;
  final Function(String) onNavItemTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentRoute,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home,
            route: '/trip-details',
            label: 'Home',
            isActive: _isActiveRoute('/trip-details'),
          ),
          _buildNavItem(
            icon: Icons.calendar_today,
            route: '/notifications',
            label: 'Calendar',
            isActive: _isActiveRoute('/notifications'),
          ),
          _buildNavItem(
            icon: Icons.event_seat,
            route: '/trip-stops',
            label: 'Bookings',
            isActive: _isActiveRoute('/trip-stops'),
          ),
          _buildNavItem(
            icon: Icons.person,
            route: '/my-account',
            label: 'Profile',
            isActive: _isActiveRoute('/my-account'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String route,
    required String label,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onNavItemTap(route),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isActive ? Color(0xFFF97316) : Color(0xFF9CA3AF),
            ),
            SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isActive ? Color(0xFFF97316) : Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isActiveRoute(String route) {
    // Handle exact matches and related routes
    switch (currentRoute) {
      case '/trip-details':
      case '/trip-stops':
        return route == '/trip-details' && currentRoute == '/trip-details';
      case '/notifications':
        return route == '/notifications';
      case '/my-account':
      case '/personal-info':
      case '/help-center':
      case '/feedback':
      case '/report-problem':
        return route == '/my-account';
      default:
        return currentRoute == route;
    }
  }
}
