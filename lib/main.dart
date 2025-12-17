import 'package:first_flutter_app/pages/cart_page.dart';
import 'package:first_flutter_app/pages/checkout_page.dart';
import 'package:first_flutter_app/pages/edit_profile_page.dart';
import 'package:first_flutter_app/pages/chat_page.dart';
import 'package:first_flutter_app/pages/forgot_password_page.dart';
import 'package:first_flutter_app/pages/login_page.dart';
import 'package:first_flutter_app/pages/notification_page.dart';
import 'package:first_flutter_app/pages/onboarding_page.dart';
import 'package:first_flutter_app/pages/order_page.dart';
import 'package:first_flutter_app/pages/order_processing_page.dart';
import 'package:first_flutter_app/pages/order_tracking_page.dart';
import 'package:first_flutter_app/pages/product_management_page.dart';
import 'package:first_flutter_app/pages/profile_page.dart';
import 'package:first_flutter_app/pages/register_page.dart';
import 'package:first_flutter_app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/detail': (context) => ProductDetailPage(),
        '/edit_profile': (context) => EditProfilePage(),
        '/profile': (context) => ProfilePage(),
        '/cart': (context) => CartPage(),
        '/message': (context) => ChatPage(),
        '/order': (context) => OrderPage(),
        '/notification': (context) => NotificationPage(),
        '/home': (context) => SparkHomePage(),
        '/checkout': (context) => CheckoutPage(),
        '/order_processing': (context) => OrderProcessingPage(),
        '/onboarding': (context) => OnboardingPage(),
        '/order_tracking': (context) => OrderTrackingPage(),
        '/product_management': (context) => ProductManagementPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
      },
    );
  }
}
