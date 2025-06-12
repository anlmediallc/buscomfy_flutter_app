import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _selectedRating = 5;
  String _selectedEmojiText = '😊';
  final _commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final List<Map<String, dynamic>> _ratingOptions = [
    {'rating': 1, 'emoji': '😞', 'label': 'Very Poor'},
    {'rating': 2, 'emoji': '😟', 'label': 'Poor'},
    {'rating': 3, 'emoji': '😐', 'label': 'Average'},
    {'rating': 4, 'emoji': '🙂', 'label': 'Good'},
    {'rating': 5, 'emoji': '😊', 'label': 'Excellent'},
  ];

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
              decoration: BoxDecoration(
                color: Colors.white,
                fontFamily: 'Inter',
              ),
              child: Column(
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
                            Icon(Icons.wifi, color: Colors.white, size: 16),
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
                          'Feedback',
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
                      padding: EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Emoji with decorative stars
                            Container(
                              margin: EdgeInsets.only(bottom: 32),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Main emoji
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      _selectedEmojiText,
                                      style: TextStyle(
                                        fontSize: 48,
                                        height: 1.0,
                                      ),
                                    ),
                                  ),

                                  // Decorative stars
                                  Positioned(
                                    top: -4,
                                    left: -4,
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFFB923C),
                                      size: 12,
                                    ),
                                  ),
                                  Positioned(
                                    top: -8,
                                    left: 50,
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFFB923C),
                                      size: 16,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: -8,
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFFB923C),
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Rating selection
                            Container(
                              margin: EdgeInsets.only(bottom: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'How was your trip experience?',
                                    style: TextStyle(
                                      color: Color(0xFF111827),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      marginBottom: 16,
                                    ),
                                  ),
                                  SizedBox(height: 16),

                                  // Rating options
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: _ratingOptions.map((option) {
                                      bool isSelected =
                                          _selectedRating == option['rating'];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedRating = option['rating'];
                                            _selectedEmojiText =
                                                option['emoji'];
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Color(
                                                    0xFFF97316,
                                                  ).withOpacity(0.1)
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: isSelected
                                                  ? Color(0xFFF97316)
                                                  : Color(0xFFE5E7EB),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                option['emoji'],
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                option['rating'].toString(),
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? Color(0xFFF97316)
                                                      : Color(0xFF6B7280),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),

                                  SizedBox(height: 8),

                                  // Rating label
                                  Center(
                                    child: Text(
                                      _ratingOptions.firstWhere(
                                        (option) =>
                                            option['rating'] == _selectedRating,
                                      )['label'],
                                      style: TextStyle(
                                        color: Color(0xFF4B5563),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Comments section
                            Container(
                              margin: EdgeInsets.only(bottom: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tell us more about your experience',
                                    style: TextStyle(
                                      color: Color(0xFF374151),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.43,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    controller: _commentController,
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Share your thoughts about the bus service, comfort, timing, or any suggestions...',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Color(0xFFF97316),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(12),
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.43,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Submit button
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: _isLoading
                                    ? null
                                    : _handleSubmitFeedback,
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
                                    child: _isLoading
                                        ? SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Text(
                                            'Submit Feedback',
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

                            SizedBox(height: 16),

                            // Thank you note
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Color(0xFFF97316),
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Your feedback helps us improve our service. Thank you!',
                                      style: TextStyle(
                                        color: Color(0xFF4B5563),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.33,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmitFeedback() {
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Thank you for your feedback! We appreciate your input.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Close',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );

      // Clear form
      Future.delayed(Duration(seconds: 1), () {
        _commentController.clear();
        setState(() {
          _selectedRating = 5;
          _selectedEmojiText = '😊';
        });
      });
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
