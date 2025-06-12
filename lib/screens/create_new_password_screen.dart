import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  _CreateNewPasswordScreenState createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://2ac212472ec64c4582e1703c57c9c27f-b99b23cf3e5141f3b8ba63a73.fly.dev/login-bg.svg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Container(
                constraints: BoxConstraints(maxWidth: 448),
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2F3e3b118899d545fe8107825676bfdf48",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(24),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 28),

                      // Create New Password Title
                      Text(
                        'Create New Password',
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 32),

                      // Description Text
                      Text(
                        'Your new password must be different from previously used passwords.',
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 24),

                      // New Password Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Password',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _newPasswordController,
                            obscureText: !_isNewPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Enter new password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFFF97316),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 12,
                                right: 48,
                                top: 8,
                                bottom: 8,
                              ),
                              suffixIcon: Positioned(
                                right: 12,
                                child: IconButton(
                                  icon: Icon(
                                    _isNewPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xFF6B7280),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isNewPasswordVisible =
                                          !_isNewPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            style: TextStyle(fontSize: 16, height: 1.5),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a new password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Confirm Password Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm Password',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: !_isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Confirm new password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFFF97316),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 12,
                                right: 48,
                                top: 8,
                                bottom: 8,
                              ),
                              suffixIcon: Positioned(
                                right: 12,
                                child: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xFF6B7280),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isConfirmPasswordVisible =
                                          !_isConfirmPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            style: TextStyle(fontSize: 16, height: 1.5),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _newPasswordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Password Requirements
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password must contain:',
                              style: TextStyle(
                                color: Color(0xFF374151),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            _buildRequirement(
                              'At least 8 characters',
                              _newPasswordController.text.length >= 8,
                            ),
                            _buildRequirement(
                              'One uppercase letter',
                              _newPasswordController.text.contains(
                                RegExp(r'[A-Z]'),
                              ),
                            ),
                            _buildRequirement(
                              'One lowercase letter',
                              _newPasswordController.text.contains(
                                RegExp(r'[a-z]'),
                              ),
                            ),
                            _buildRequirement(
                              'One number',
                              _newPasswordController.text.contains(
                                RegExp(r'[0-9]'),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24),

                      // Reset Password Button
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleResetPassword,
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
                                      'Reset Password',
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

                      SizedBox(height: 32),

                      // Back to Login Link
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(
                            'Back to Login',
                            style: TextStyle(
                              color: Color(0xFFF97316),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequirement(String text, bool isMet) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 12,
            color: isMet ? Color(0xFF10B981) : Color(0xFF9CA3AF),
          ),
          SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: isMet ? Color(0xFF10B981) : Color(0xFF6B7280),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _handleResetPassword() {
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
              'Password reset successfully! Please login with your new password.',
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

        // Navigate back to login after a delay
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      });
    }
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
