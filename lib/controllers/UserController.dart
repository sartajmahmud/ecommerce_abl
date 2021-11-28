import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/helpers/Helper.dart';
import 'package:grocery_app/models/User.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:grocery_app/repositories/UserRepository.dart' as repository;

class UserController extends ControllerMVC{
 User user = new User();
 GlobalKey<FormState> loginFormKey;
 GlobalKey<ScaffoldState> scaffoldKey;
 FirebaseMessaging _firebaseMessaging;
 OverlayEntry loader;

 UserController() {
  loader = Helper.overlayLoader(context);
  loginFormKey = new GlobalKey<FormState>();
  this.scaffoldKey = new GlobalKey<ScaffoldState>();
  _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.getToken().then((String _deviceToken) {
   user.deviceToken = _deviceToken;
  }).catchError((e) {
   print('Notification not configured');
  });
 }

 void login() async {
  FocusScope.of(context).unfocus();
  if (loginFormKey.currentState.validate()) {
   loginFormKey.currentState.save();
   Overlay.of(context).insert(loader);
   repository.login(user).then((value) async{
    if (value != null && value.apiToken != null) {
     //Navigator.of(scaffoldKey.currentContext).pushReplacement( MaterialPageRoute(builder: (context) => ZoneSelectionScreen()) );
     // Navigator.of(scaffoldKey.currentContext).pushReplacementNamed('/Pages', arguments: 1);
    } else {
     String result = await duplicateAC();
     if (result == "true") {
      print("this is duplicate");
      scaffoldKey?.currentState
          ?.showSnackBar(SnackBar(
          content: Text("Incorrect Password")));
     } else {
      scaffoldKey?.currentState
          ?.showSnackBar(SnackBar(
          content: Text('No account is associated with this number. Please sign up. ')));
     }
     // scaffoldKey?.currentState?.showSnackBar(SnackBar(
     //   content: Text("Wrong mobile number or password"),
     // ));
    }
   }).catchError((e) async{
    loader.remove();
    String result = await duplicateAC();
    if (result == "true") {
     print("this is duplicate");
     scaffoldKey?.currentState
         ?.showSnackBar(SnackBar(
         content: Text("Incorrect Password")));
    } else {
     scaffoldKey?.currentState
         ?.showSnackBar(SnackBar(
         content: Text('No account is associated with this number. Please sign up. ')));
    }
    // scaffoldKey?.currentState?.showSnackBar(SnackBar(
    //   content: Text("Wrong mobile number or password"),
    // ));
   }).whenComplete(() {
    Helper.hideLoader(loader);
   });
  }
 }

 void register() async {
  FocusScope.of(context).unfocus();
  if (loginFormKey.currentState.validate()) {
   loginFormKey.currentState.save();
   Overlay.of(context).insert(loader);
   repository.register(user).then((value) {
    if (value != null && value.apiToken != null) {
    // Navigator.of(scaffoldKey.currentContext).pushReplacement( MaterialPageRoute(builder: (context) => ZoneSelectionScreen()) );
     //  Navigator.of(scaffoldKey.currentContext).pushReplacementNamed('/Pages', arguments: 1);
    } else {
     scaffoldKey?.currentState?.showSnackBar(SnackBar(
      content: Text("Wrong filled fields"),
     ));
    }
   }).catchError((e) {
    loader?.remove();
    scaffoldKey?.currentState?.showSnackBar(SnackBar(
     content: Text("Account already exists"),
    ));
   }).whenComplete(() {
    Helper.hideLoader(loader);
   });
  }
 }

 Future<String> duplicateAC() async{
  final response=await repository.getDuplicateAC(user);
  print('duplicate result controller $response');
  String result=response.toString();
  return result;
 }

 Future<String> resetPass() async{
  final response=await repository.getResetPass(user);
  String result=response.toString();
  return result;
 }
}