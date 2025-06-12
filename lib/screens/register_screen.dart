import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
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
              "https://cdn.builder.io/api/v1/image/assets%2F47bedcd915494a2c9d8c3faf11622396%2F3e3b118899d545fe8107825676bfdf48",
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
                      SizedBox(height: 12),

                      // Register Title
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 16),

                      // First Name and Last Name Row
                      Row(
                        children: [
                          // First Name Field
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'First Name',
                                  style: TextStyle(
                                    color: Color(0xFF374151),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 1.33,
                                  ),
                                ),
                                SizedBox(height: 4),
                                TextFormField(
                                  controller: _firstNameController,
                                  decoration: InputDecoration(
                                    hintText: 'Dinesh',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFD1D5DB),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFD1D5DB),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFF97316),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    isDense: true,
                                  ),
                                  style: TextStyle(fontSize: 14, height: 1.43),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 8),

                          // Last Name Field
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Last Name',
                                  style: TextStyle(
                                    color: Color(0xFF374151),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 1.33,
                                  ),
                                ),
                                SizedBox(height: 4),
                                TextFormField(
                                  controller: _lastNameController,
                                  decoration: InputDecoration(
                                    hintText: 'VG',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFD1D5DB),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFD1D5DB),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFF97316),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    isDense: true,
                                  ),
                                  style: TextStyle(fontSize: 14, height: 1.43),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      // Email Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-mail',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.33,
                            ),
                          ),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFF97316),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              isDense: true,
                            ),
                            style: TextStyle(fontSize: 14, height: 1.43),
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
                        ],
                      ),

                      SizedBox(height: 12),

                      // Password Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              hintText: 'Enter your password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFF97316),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 12,
                                right: 32,
                                top: 8,
                                bottom: 8,
                              ),
                              isDense: true,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xFF6B7280),
                                  size: 12,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(fontSize: 14, height: 1.43),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      // Confirm Password Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm Password',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.33,
                            ),
                          ),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: !_isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Confirm your password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFD1D5DB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFF97316),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 12,
                                right: 32,
                                top: 8,
                                bottom: 8,
                              ),
                              isDense: true,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xFF6B7280),
                                  size: 12,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible =
                                        !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(fontSize: 14, height: 1.43),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Register Button
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleRegister,
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
                                      'Register',
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

                      // Login Link
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: Color(0xFF4B5563),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/login',
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Color(0xFFF97316),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.43,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
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

  void _handleRegister() {
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
              'Account created successfully! Please verify your email.',
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

        // Navigate to verification screen
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, '/verification');
        });
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
