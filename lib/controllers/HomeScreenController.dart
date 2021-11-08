import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeScreenController extends ControllerMVC{
  //FirebaseMessaging _firebaseMessaging;

  HomeScreenController(){
    // _firebaseMessaging = FirebaseMessaging();
    // _firebaseMessaging.getToken().then((String _deviceToken) {
    //   //user.deviceToken = _deviceToken;
    //   print('DT : '+_deviceToken);
    // }).catchError((e) {
    //   print('Notification not configured');
    // });
  }
}