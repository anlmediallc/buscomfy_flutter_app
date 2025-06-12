import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  int _resendCountdown = 59;
  Timer? _timer;
  String _email = 'johndoe@gmail.com';

  @override
  void initState() {
    super.initState();
    _startCountdown();
    _codeController.addListener(_onCodeChanged);
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendCountdown > 0) {
          _resendCountdown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _onCodeChanged() {
    setState(() {
      // Update UI when code changes
    });
  }

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
                      SizedBox(height: 28),

                      // Verify Account Title
                      Text(
                        'Verify Account',
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 32),

                      // Email Description
                      Column(
                        children: [
                          Text(
                            'We\'ve sent a verification code to',
                            style: TextStyle(
                              color: Color(0xFF4B5563),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.43,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            _email,
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Code Input Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Code',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _codeController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 4,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              hintText: '1234',
                              counterText: '', // Hide character counter
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
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              height: 1.33,
                              letterSpacing: 2.4,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the verification code';
                              }
                              if (value.length != 4) {
                                return 'Code must be 4 digits';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Resend Code Timer
                      Center(
                        child: _resendCountdown > 0
                            ? Text(
                                'Resend code in 0:${_resendCountdown.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              )
                            : GestureDetector(
                                onTap: _handleResendCode,
                                child: Text(
                                  'Resend Code',
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

                      // Verify Account Button
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed:
                              (_codeController.text.length == 4 && !_isLoading)
                              ? _handleVerifyAccount
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            disabledBackgroundColor: Colors.transparent,
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
                              child: Opacity(
                                opacity:
                                    (_codeController.text.length == 4 &&
                                        !_isLoading)
                                    ? 1.0
                                    : 0.5,
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
                                        'Verify Account',
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
                      ),

                      SizedBox(height: 32),

                      // Change Email Link
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              'Want to try a different email? ',
                              style: TextStyle(
                                color: Color(0xFF4B5563),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),
                            ),
                            GestureDetector(
                              onTap: _handleChangeEmail,
                              child: Text(
                                'Change Email',
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

  void _handleVerifyAccount() {
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
              'Account verified successfully! Welcome to Buscomfy+',
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

        // Navigate to trip details after successful verification
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, '/trip-details');
        });
      });
    }
  }

  void _handleResendCode() {
    setState(() {
      _resendCountdown = 59;
    });
    _startCountdown();

    // Show confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Verification code sent to $_email',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _handleChangeEmail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final emailController = TextEditingController(text: _email);
        return AlertDialog(
          title: Text('Change Email'),
          content: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'New Email Address',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _email = emailController.text;
                  _resendCountdown = 59;
                });
                _startCountdown();
                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Verification code sent to ${emailController.text}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xFF10B981),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              child: Text('Send Code'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
