import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:grocery_app/controllers/SplashScreenController.dart';
import 'package:grocery_app/helpers/custom_trace.dart';
import 'package:grocery_app/repositories/UserRepository.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  SplashScreenController _con;

  _SplashScreenState() : super(SplashScreenController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    initialFunction();
  }


  initialFunction() async{
    WidgetsFlutterBinding.ensureInitialized();
    await GlobalConfiguration().loadFromAsset("configurations");
    await Firebase.initializeApp().then((value) async {
      // Navigator.of(context).pushReplacement(new MaterialPageRoute(
      //   builder: (BuildContext context) {
      //     return WelcomeScreen();
      //   },
      // ));
      Navigator.pushNamed(context, '/welcome');
    });

    print(CustomTrace(StackTrace.current, message: "base_url: ${GlobalConfiguration().getValue('base_url')}"));
    print(CustomTrace(StackTrace.current, message: "api_base_url: ${GlobalConfiguration().getValue('api_base_url')}"));
    //initSettings();
    await getCurrentUser();
    // loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}

Widget splashScreenIcon() {
  String iconPath = "assets/images/bizol_logo.png";
  return Image.asset(
    iconPath,
    scale: 7,
  );
}
