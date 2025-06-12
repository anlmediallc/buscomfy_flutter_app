import 'package:flutter/material.dart';

class LuggageCheckInScreen extends StatefulWidget {
  const LuggageCheckInScreen({super.key});

  @override
  _LuggageCheckInScreenState createState() => _LuggageCheckInScreenState();
}

class _LuggageCheckInScreenState extends State<LuggageCheckInScreen> {
  String _selectedLuggageType = 'Suitcase';
  String _selectedWeight = 'Light (under 10kg)';
  String _selectedPriority = 'Standard';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final List<String> _luggageTypes = [
    'Suitcase',
    'Backpack',
    'Duffle Bag',
    'Carry-on',
    'Sports Equipment',
    'Musical Instrument',
    'Other',
  ];

  final List<String> _weightOptions = [
    'Light (under 10kg)',
    'Medium (10-20kg)',
    'Heavy (20-30kg)',
    'Extra Heavy (over 30kg)',
  ];

  final List<String> _priorityOptions = ['Standard', 'Priority', 'Express'];

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
              child: Column(
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
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 11),
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
                        SizedBox(width: 33),
                        Text(
                          'Luggage Check-In',
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

                  // White content section with rounded top corners
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
                      child: Column(
                        children: [
                          // Secondary header
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
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
                                      color: Color(0xFF020817),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 37),
                                Text(
                                  'Luggage Check-In',
                                  style: TextStyle(
                                    color: Color(0xFF020817),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Form section
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 15,
                                    offset: Offset(0, 10),
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Luggage Type Dropdown
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Luggage Type',
                                          style: TextStyle(
                                            color: Color(0xFF374151),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 1.43,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        DropdownButtonFormField<String>(
                                          value: _selectedLuggageType,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFD1D5DB),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFD1D5DB),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFF97316),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                          ),
                                          style: TextStyle(
                                            color: Color(0xFF020817),
                                            fontSize: 14,
                                            height: 1.43,
                                          ),
                                          items: _luggageTypes.map((
                                            String type,
                                          ) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedLuggageType = newValue!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20),

                                    // Weight Category Dropdown
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Weight Category',
                                          style: TextStyle(
                                            color: Color(0xFF374151),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 1.43,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        DropdownButtonFormField<String>(
                                          value: _selectedWeight,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFD1D5DB),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFD1D5DB),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFF97316),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                          ),
                                          style: TextStyle(
                                            color: Color(0xFF020817),
                                            fontSize: 14,
                                            height: 1.43,
                                          ),
                                          items: _weightOptions.map((
                                            String weight,
                                          ) {
                                            return DropdownMenuItem<String>(
                                              value: weight,
                                              child: Text(weight),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedWeight = newValue!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20),

                                    // Priority Level Dropdown
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Priority Level',
                                          style: TextStyle(
                                            color: Color(0xFF374151),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 1.43,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        DropdownButtonFormField<String>(
                                          value: _selectedPriority,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFD1D5DB),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFD1D5DB),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Color(0xFFF97316),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                          ),
                                          style: TextStyle(
                                            color: Color(0xFF020817),
                                            fontSize: 14,
                                            height: 1.43,
                                          ),
                                          items: _priorityOptions.map((
                                            String priority,
                                          ) {
                                            return DropdownMenuItem<String>(
                                              value: priority,
                                              child: Text(priority),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedPriority = newValue!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 24),

                                    // Info Card
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3F4F6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            color: Color(0xFF6B7280),
                                            size: 20,
                                          ),
                                          SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              'Please ensure your luggage is properly labeled and within weight limits.',
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

                                    Spacer(),

                                    // Check-In Button
                                    SizedBox(
                                      width: double.infinity,
                                      height: 48,
                                      child: ElevatedButton(
                                        onPressed: _isLoading
                                            ? null
                                            : _handleCheckIn,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(
                                                  0xFFF7960F,
                                                ), // rgb(247, 150, 15)
                                                Color(
                                                  0xFFFF8C00,
                                                ), // rgb(255, 140, 0)
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: _isLoading
                                                ? SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                          color: Colors.white,
                                                          strokeWidth: 2,
                                                        ),
                                                  )
                                                : Text(
                                                    'Check-In Luggage',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5,
                                                    ),
                                                  ),
                                          ),
                                        ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleCheckIn() {
    if (_formKey.currentState!.validate()) {
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
              'Luggage checked in successfully! Check your email for confirmation.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFF10B981),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            duration: Duration(seconds: 3),
          ),
        );

        // Navigate back after success
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      });
    }
  }
}
