import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
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

                      // Forgot Password Title
                      Text(
                        'Forgot Password',
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
                        'Enter your email address and we\'ll send you a link to reset your password.',
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 24),

                      // Email Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-mail',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
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
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            style: TextStyle(fontSize: 16, height: 1.5),
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

                      SizedBox(height: 24),

                      // Send Reset Link Button
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleSendResetLink,
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
                                      'Send Reset Link',
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
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              'Remember your password? ',
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

  void _handleSendResetLink() {
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
              'Password reset link sent to ${_emailController.text}',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFF10B981),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );

        // Navigate back to login after a delay
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
