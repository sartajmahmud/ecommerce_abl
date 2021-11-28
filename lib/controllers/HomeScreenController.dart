import 'package:flutter/material.dart';
import 'package:grocery_app/models/Slide.dart';
import 'package:grocery_app/repositories/SliderRepository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeScreenController extends ControllerMVC{

  /// listen for home screen products, Sellers, refresh , banners, top categories, categories
  //FirebaseMessaging _firebaseMessaging;
  List<Slide> slides = <Slide>[];
  GlobalKey<ScaffoldState> scaffoldKey;
  HomeScreenController(){
    // _firebaseMessaging = FirebaseMessaging();
    // _firebaseMessaging.getToken().then((String _deviceToken) {
    //   //user.deviceToken = _deviceToken;
    //   print('DT : '+_deviceToken);
    // }).catchError((e) {
    //   print('Notification not configured');
    // });
    listenForSlides();
    listenForTopCategories();
    listenForFlashCategories();
    listenForTodaysDeal();
    listenForFeaturedProducts();
  }

  Future<void> listenForSlides() async {
    final Stream<Slide> stream = await getSlides();
    stream.listen((Slide _slide) {
      setState(() => slides.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  Future<void> refreshHome() async {
    setState((){
      slides = <Slide>[];
    });
    await listenForSlides();
  }

  Future<void> listenForTopCategories() async {

  }

  Future<void> listenForFlashCategories() async {

  }

  Future<void> listenForTodaysDeal() async {

  }
  Future<void> listenForFeaturedProducts() async {

  }

}