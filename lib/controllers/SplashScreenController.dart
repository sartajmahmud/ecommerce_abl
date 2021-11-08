import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/helpers/custom_trace.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashScreenController extends ControllerMVC{

  GlobalKey<ScaffoldState> scaffoldKey;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  SplashScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    configureFirebase(firebaseMessaging);
    firebaseMessaging.getToken().then((value) => print(value));
    // firebaseMessaging.getToken().then((String _deviceToken) {
    //   //user.deviceToken = _deviceToken;
    //   print("DT: "+_deviceToken);
    // }).catchError((e) {
    //   print('Notification not configured');
    // });
  }

  void configureFirebase(FirebaseMessaging _firebaseMessaging) {
    try {
      _firebaseMessaging.configure(
        onMessage: notificationOnMessage,
        onLaunch: notificationOnLaunch,
        onResume: notificationOnResume,
      );
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
      print(CustomTrace(StackTrace.current, message: 'Error Config Firebase'));
    }
  }

  Future notificationOnResume(Map<String, dynamic> message) async {

    print(CustomTrace(StackTrace.current, message: message['data']['id']));
    try {

    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Future notificationOnLaunch(Map<String, dynamic> message) async {
    try {

    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Future notificationOnMessage(Map<String, dynamic> message) async {
    print(message['notification']['title']);
    List parts = message['notification']['title'].toString().split(' ');
    print(parts);
  }
}