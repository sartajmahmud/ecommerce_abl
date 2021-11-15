import 'package:flutter/material.dart';
import 'package:grocery_app/screens/DeliveryMethodScreen.dart';
import 'package:grocery_app/screens/ForgetPasswordScreen.dart';
import 'package:grocery_app/screens/LoginScreen.dart';
import 'package:grocery_app/screens/NoInternetScreen.dart';
import 'package:grocery_app/screens/NotificationDetailsScreen.dart';
import 'package:grocery_app/screens/NotificationsScreen.dart';
import 'package:grocery_app/screens/OrderDetailsScreen.dart';
import 'package:grocery_app/screens/OrderHistoryScreen.dart';
import 'package:grocery_app/screens/PaymentMethodScreen.dart';
import 'package:grocery_app/screens/ProfileScreen.dart';
import 'package:grocery_app/screens/SellerSelectionScreen.dart';
import 'package:grocery_app/screens/SignUpScreen.dart';
import 'package:grocery_app/screens/UserDetailsScreen.dart';
import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
import 'package:grocery_app/screens/order_accepted_screen.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/styles/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgetPass': (context) => ForgetPasswordScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/home': (context) => DashboardScreen(),
        '/profile': (context) => ProfileScreen(),
        '/noInternet': (context) => NoInternetScreen(),
        '/sellerSelectionScreen': (context) => SellerSelectionScreen(),
        '/paymentMethodScreen': (context) => PaymentMethodScreen(),
        '/orderConfirmScreen': (context) => OrderAcceptedScreen(),
        '/orderDetailsScreen': (context) => OrderDetailsScreen(),
        '/notificationsScreen': (context) => NotificationsScreen(),
        '/notificationDetailsScreen': (context) => NotificationDetailsScreen(),
        '/orderHistoryScreen': (context) => OrderHistoryScreen(),
        '/userDetailsScreen': (context) => UserDetailsScreen(),
        '/deliveryMethodScreen': (context) => DeliveryMethodScreen(),


      },
    );
  }
}
