import 'package:flutter/material.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  // Help topics data
  final List<Map<String, dynamic>> _helpTopics = [
    {
      'emoji': '🎫',
      'title': 'Booking & Tickets',
      'subtitle':
          'How to book tickets, cancel bookings, and manage reservations',
      'articles': 12,
    },
    {
      'emoji': '💳',
      'title': 'Payment Issues',
      'subtitle': 'Payment methods, refunds, and transaction problems',
      'articles': 8,
    },
    {
      'emoji': '🚌',
      'title': 'Trip Information',
      'subtitle': 'Bus schedules, delays, route changes, and trip updates',
      'articles': 15,
    },
    {
      'emoji': '📱',
      'title': 'App Usage',
      'subtitle': 'How to use the app, features, and troubleshooting',
      'articles': 10,
    },
    {
      'emoji': '👤',
      'title': 'Account & Profile',
      'subtitle': 'Account settings, profile management, and security',
      'articles': 6,
    },
    {
      'emoji': '🎒',
      'title': 'Luggage & Check-in',
      'subtitle': 'Luggage policies, check-in process, and restrictions',
      'articles': 5,
    },
    {
      'emoji': '📞',
      'title': 'Contact Support',
      'subtitle': 'Get in touch with our customer support team',
      'articles': 3,
    },
    {
      'emoji': '❓',
      'title': 'General Questions',
      'subtitle': 'Frequently asked questions and general information',
      'articles': 20,
    },
  ];

  List<Map<String, dynamic>> get _filteredTopics {
    if (_searchQuery.isEmpty) {
      return _helpTopics;
    }
    return _helpTopics.where((topic) {
      return topic['title'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          topic['subtitle'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFF3F4F6)),
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 448),
              height: 650,
              decoration: BoxDecoration(
                color: Colors.white,
                fontFamily: 'Inter',
              ),
              child: Column(
                children: [
                  // Status bar
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '9:41',
                          style: TextStyle(
                            color: Colors.black,
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
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  width: 4,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  width: 4,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  width: 4,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 4),
                            // WiFi icon
                            Icon(Icons.wifi, color: Colors.black, size: 16),
                            SizedBox(width: 4),
                            // Battery indicator
                            Container(
                              width: 24,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
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
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
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
                              color: Color(0xFF374151),
                              size: 24,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Help Center',
                          style: TextStyle(
                            color: Color(0xFF111827),
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
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Search bar
                          Container(
                            margin: EdgeInsets.only(bottom: 24),
                            child: TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                setState(() {
                                  _searchQuery = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF9CA3AF),
                                    size: 20,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE5E7EB),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE5E7EB),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xFFF97316),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF9FAFB),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 8,
                                ),
                              ),
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ),

                          // Help topics list
                          Expanded(
                            child: ListView.builder(
                              itemCount: _filteredTopics.length,
                              itemBuilder: (context, index) {
                                final topic = _filteredTopics[index];
                                return _buildHelpTopicItem(topic);
                              },
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
    );
  }

  Widget _buildHelpTopicItem(Map<String, dynamic> topic) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            _handleTopicTap(topic);
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Emoji icon
                Container(
                  width: 48,
                  height: 48,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      topic['emoji'],
                      style: TextStyle(fontSize: 20, height: 1.0),
                    ),
                  ),
                ),

                // Topic content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topic['title'],
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        topic['subtitle'],
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.33,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${topic['articles']} articles',
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),

                // Chevron arrow
                Icon(Icons.chevron_right, color: Color(0xFF9CA3AF), size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleTopicTap(Map<String, dynamic> topic) {
    // Show topic details or navigate to articles
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(topic['emoji'], style: TextStyle(fontSize: 24)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      topic['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                topic['subtitle'],
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Opening ${topic['title']} articles...',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xFFF97316),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
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
                        'View Articles (${topic['articles']})',
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
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
