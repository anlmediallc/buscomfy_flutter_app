import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/login_error_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/create_new_password_screen.dart';
import 'screens/register_screen.dart';
import 'screens/my_account_screen.dart';
import 'screens/luggage_check_in_screen.dart';
import 'screens/notification_center_screen.dart';
import 'screens/personal_info_screen.dart';
import 'screens/feedback_screen.dart';
import 'screens/help_center_screen.dart';
import 'screens/report_problem_screen.dart';
import 'screens/trip_details_screen.dart';
import 'screens/trip_stops_screen.dart';
import 'screens/verification_screen.dart';

void main() {
  runApp(const BuscomfyApp());
}

class BuscomfyApp extends StatelessWidget {
  const BuscomfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscomfy+',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Inter'),
      initialRoute: '/',
      routes: {
        '/': (context) => BuscomfySplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/login-error': (context) => LoginErrorScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/create-new-password': (context) => CreateNewPasswordScreen(),
        '/register': (context) => RegisterScreen(),
        '/my-account': (context) => MyAccountScreen(),
        '/luggage-check-in': (context) => LuggageCheckInScreen(),
        '/notifications': (context) => NotificationCenterScreen(),
        '/personal-info': (context) => PersonalInfoScreen(),
        '/feedback': (context) => FeedbackScreen(),
        '/help-center': (context) => HelpCenterScreen(),
        '/report-problem': (context) => ReportProblemScreen(),
        '/trip-details': (context) => TripDetailsScreen(),
        '/trip-stops': (context) => TripStopsScreen(),
        '/verification': (context) => VerificationScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
