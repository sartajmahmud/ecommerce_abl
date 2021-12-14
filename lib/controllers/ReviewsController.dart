import 'package:flutter/material.dart';
import 'package:grocery_app/models/Order.dart';
import 'package:grocery_app/models/OrderStatus.dart';
import 'package:grocery_app/models/Product.dart';
import 'package:grocery_app/repositories/OrderRepository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/Review.dart';
import 'package:grocery_app/repositories/SellerRepository.dart' as SellerRepo;
import 'package:grocery_app/repositories/ProductRepository.dart' as productRepo;

class ReviewsController extends ControllerMVC {
  Review restaurantReview;
  List<Review> productsReviews = [];
  Order order;
  List<Product> productsOfOrder = [];
  List<OrderStatus> orderStatus = <OrderStatus>[];
  GlobalKey<ScaffoldState> scaffoldKey;

  ReviewsController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    this.restaurantReview = new Review.init("0");
  }

  void listenForOrder({String orderId, String message}) async {
    final Stream<Order> stream = await getOrder(orderId);
    stream.listen((Order _order) {
      setState(() {
        order = _order;
        productsReviews = List.generate(order.productOrders.length, (_) => new Review.init("0"));
      });
    }, onError: (a) {
      print(a);
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text("Verify your internet connection"),
      ));
    }, onDone: () {
      getProductsOfOrder();
      if (message != null) {
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });
  }

  void addProductReview(Review _review, Product _product) async {
    productRepo.addProductReview(_review, _product).then((value) {
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text("Product has been Successfully rated"),
      ));
    });
  }

  // void addSellerReview(Review _review) async {
  //   SellerRepo.addSellerReview(_review, this.order.productOrders[0].product.seller).then((value) {
  //     refreshOrder();
  //     scaffoldKey?.currentState?.showSnackBar(SnackBar(
  //       content: Text("Seller has been successfully rated"),
  //     ));
  //   });
  // }

  Future<void> refreshOrder() async {
    listenForOrder(orderId: order.id, message: "Reviews refreshed successfully");
  }

  void getProductsOfOrder() {
    this.order.productOrders.forEach((_productOrder) {
      if (!productsOfOrder.contains(_productOrder.product)) {
        productsOfOrder.add(_productOrder.product);
      }
    });
  }
}
