import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

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
                    children: [
                      SizedBox(height: 28),

                      // Login Title
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 32),

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

                      // Password Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
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
                                    _isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xFF6B7280),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            style: TextStyle(fontSize: 16, height: 1.5),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFFF97316),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.43,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24),

                      // Login Button
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle login
                              Navigator.pushReplacementNamed(
                                context,
                                '/trip-details',
                              );
                            }
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
                                'Login',
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

                      // Divider with "Or continue with"
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Color(0xFFD1D5DB),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Color(0xFFD1D5DB),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Facebook Login Button
                      SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle Facebook login
                            print('Facebook login tapped');
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Color(0xFFD1D5DB)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Color(0xFF2563EB),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.43,
                                ),
                              ),
                            ],
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
