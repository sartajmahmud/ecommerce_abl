import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/controllers/WelcomeScreenController.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends StateMVC<WelcomeScreen> {
  WelcomeScreenController _con;

  _WelcomeScreenState() : super(WelcomeScreenController()) {
    _con = controller;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getWelcomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(_con.welcomescreen.media.url),
          //     fit: BoxFit.none,
          //   ),
          // ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //Text(_con.welcomeScreens.first.toString()),
                Spacer(),
                //icon(),
                SizedBox(
                  height: 20,
                ),
                //welcomeTextWidget(),
                SizedBox(
                  height: 10,
                ),
                sloganText(),
                SizedBox(
                  height: 40,
                ),
                getButton(context),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }

  Widget icon() {
    String iconPath = "assets/icons/app_icon.svg";
    return SvgPicture.asset(
      iconPath,
      width: 48,
      height: 56,
    );
  }

  Widget welcomeTextWidget() {
    return Column(
      children: [
        AppText(
          text: "Welcome",
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        AppText(
          text: "to our store",
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget sloganText() {
    return AppText(
      text: "Get your Engine Oil faster",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xffFCFCFC).withOpacity(0.7),
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Get Started",
      fontWeight: FontWeight.w600,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        onGetStartedClicked(context);
      },
    );
  }

  void onGetStartedClicked(BuildContext context) {
    // Navigator.of(context).pushReplacement(new MaterialPageRoute(
    //   builder: (BuildContext context) {
    //     return DashboardScreen();
    //   },
    // ));
    Navigator.pushNamed(context, '/home');
  }
}
