import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _nameController = TextEditingController(text: 'James Rodriguez');
  final _emailController = TextEditingController(
    text: 'Jamesrodriguez@gmail.com',
  );
  final _passwordController = TextEditingController(text: '••••••••');
  final _phoneController = TextEditingController(text: '+1 234 567 8900');
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _profileImageUrl =
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face';

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
                      child: Column(
                        children: [
                          // Profile picture section
                          Container(
                            padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
                            child: Center(
                              child: Stack(
                                children: [
                                  // Profile picture
                                  Container(
                                    width: 96,
                                    height: 96,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(48),
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(48),
                                      child: Image.network(
                                        _profileImageUrl,
                                        fit: BoxFit.cover,
                                        width: 96,
                                        height: 96,
                                      ),
                                    ),
                                  ),

                                  // Camera edit button
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: _handleProfilePictureEdit,
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                              blurRadius: 15,
                                              offset: Offset(0, 10),
                                            ),
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                              blurRadius: 6,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Form section
                          Expanded(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.fromLTRB(24, 0, 24, 96),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name Field
                                    _buildFormField(
                                      label: 'Name',
                                      controller: _nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                    ),

                                    SizedBox(height: 12),

                                    // Email Field
                                    _buildFormField(
                                      label: 'E mail address',
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        if (!value.contains('@')) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
                                    ),

                                    SizedBox(height: 12),

                                    // Phone Field
                                    _buildFormField(
                                      label: 'Phone Number',
                                      controller: _phoneController,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your phone number';
                                        }
                                        return null;
                                      },
                                    ),

                                    SizedBox(height: 12),

                                    // Password Field
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Password',
                                          style: TextStyle(
                                            color: Color(0xFF374151),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.33,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        TextFormField(
                                          controller: _passwordController,
                                          obscureText: !_isPasswordVisible,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color(0xFFE5E7EB),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color(0xFFE5E7EB),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color(0xFFF97316),
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.only(
                                              left: 12,
                                              right: 40,
                                              top: 8,
                                              bottom: 8,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _isPasswordVisible
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Color(0xFF6B7280),
                                                size: 16,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isPasswordVisible =
                                                      !_isPasswordVisible;
                                                });
                                              },
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontSize: 14,
                                            height: 1.43,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 24),

                                    // Save Button
                                    SizedBox(
                                      width: double.infinity,
                                      height: 48,
                                      child: ElevatedButton(
                                        onPressed: _isLoading
                                            ? null
                                            : _handleSave,
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
                                                    'Save Changes',
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

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF374151),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.33,
          ),
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFF97316)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          style: TextStyle(fontSize: 14, height: 1.43),
          validator: validator,
        ),
      ],
    );
  }

  void _handleProfilePictureEdit() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Update Profile Picture',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle camera capture
                  print('Take photo');
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle gallery selection
                  print('Choose from gallery');
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text(
                  'Remove Photo',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _profileImageUrl =
                        'https://via.placeholder.com/150x150?text=No+Image';
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleSave() {
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
              'Personal information updated successfully!',
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
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
