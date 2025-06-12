import 'package:flutter/material.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  @override
  _ReportProblemScreenState createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  String _selectedIssueType = 'Delay';
  String _selectedPriority = 'Medium';
  final _descriptionController = TextEditingController();
  final _contactController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final List<String> _issueTypes = [
    'Delay',
    'Vehicle Condition',
    'Staff Behavior',
    'Safety Concern',
    'Overcharging',
    'Lost Item',
    'Accessibility Issue',
    'Route Problem',
    'Booking Issue',
    'Other',
  ];

  final List<String> _priorityLevels = ['Low', 'Medium', 'High', 'Urgent'];

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
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
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
                        SizedBox(width: 41),
                        Text(
                          'Report a problem',
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
                      transform: Matrix4.translationValues(0, -12, 0),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(24),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Issue Type Dropdown
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Issue Type',
                                    style: TextStyle(
                                      color: Color(0xFF374151),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.43,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: _selectedIssueType,
                                    decoration: InputDecoration(
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
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Color(0xFF020817),
                                      fontSize: 14,
                                      height: 1.43,
                                    ),
                                    items: _issueTypes.map((String type) {
                                      return DropdownMenuItem<String>(
                                        value: type,
                                        child: Text(type),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedIssueType = newValue!;
                                      });
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),

                              // Priority Level Dropdown
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: _selectedPriority,
                                    decoration: InputDecoration(
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
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Color(0xFF020817),
                                      fontSize: 14,
                                      height: 1.43,
                                    ),
                                    items: _priorityLevels.map((
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

                              SizedBox(height: 20),

                              // Problem Description
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Describe the problem',
                                    style: TextStyle(
                                      color: Color(0xFF374151),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.43,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    controller: _descriptionController,
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Please provide detailed information about the issue you experienced...',
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
                                      contentPadding: EdgeInsets.all(12),
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.43,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please describe the problem';
                                      }
                                      if (value.length < 10) {
                                        return 'Please provide more details (at least 10 characters)';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),

                              // Contact Information (Optional)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contact Information (Optional)',
                                    style: TextStyle(
                                      color: Color(0xFF374151),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.43,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    controller: _contactController,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Phone number or email for follow-up',
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
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.43,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 24),

                              // Info note
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
                                      size: 16,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Your report will be reviewed within 24-48 hours. We appreciate your feedback.',
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

                              SizedBox(height: 24),

                              // Submit Button
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: _isLoading
                                      ? null
                                      : _handleSubmitReport,
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
                                          Color(
                                            0xFFF7960F,
                                          ), // rgb(247, 150, 15)
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
                                              'Submit Report',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmitReport() {
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
              'Problem report submitted successfully! We will review your report within 24-48 hours.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFF10B981),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            duration: Duration(seconds: 4),
            action: SnackBarAction(
              label: 'Close',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );

        // Clear form after successful submission
        Future.delayed(Duration(seconds: 2), () {
          _descriptionController.clear();
          _contactController.clear();
          setState(() {
            _selectedIssueType = 'Delay';
            _selectedPriority = 'Medium';
          });
        });
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _contactController.dispose();
    super.dispose();
  }
}
