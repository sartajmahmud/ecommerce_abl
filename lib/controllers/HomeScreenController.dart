import 'package:flutter/material.dart';
import 'package:grocery_app/models/FeaturedProduct.dart';
import 'package:grocery_app/models/Product.dart';
import 'package:grocery_app/models/Slide.dart';
import 'package:grocery_app/repositories/CategoryRepository.dart';
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
    listenForFlashSalesCategories();
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

  List topCategoryProducts = [];
  Future<void> listenForTopCategories() async {
    final Stream<FeaturedProduct> stream = await getTopCategoryProducts();
    stream.listen((FeaturedProduct _slide) {
      print("topCategoryProducts url "+_slide.product.name);
      setState(() => topCategoryProducts.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});

  }

  List flashCategoryProducts = [];
  Future<void> listenForFlashSalesCategories() async {
    final Stream<FeaturedProduct> stream = await getFlashSalesProducts();
    stream.listen((FeaturedProduct _slide) {
      print("listenForFlashCategories url "+_slide.product.name);
      setState(() => flashCategoryProducts.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  List todaysDealProducts = [];
  Future<void> listenForTodaysDeal() async {
    final Stream<FeaturedProduct> stream = await getTodaysDealProducts();
    stream.listen((FeaturedProduct _slide) {
      print("listenForTodaysDeal url "+_slide.product.name);
      setState(() => todaysDealProducts.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  List featuredProducts = [];
  Future<void> listenForFeaturedProducts() async {
    final Stream<FeaturedProduct> stream = await getFeaturedProducts();
    stream.listen((FeaturedProduct _slide) {
      print("featuredProducts url "+_slide.product.name);
      setState(() => featuredProducts.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

}