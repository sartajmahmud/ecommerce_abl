import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grocery_app/repositories/CartRepository.dart';
import 'package:grocery_app/repositories/UserRepository.dart';
import '../models/User.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../helpers/helper.dart';
import '../models/Cart.dart';


class CartController extends ControllerMVC {
  List<Cart> carts = <Cart>[];
  // double taxAmount = 0.0;
  double deliveryFee = 0.0;
  // ValueNotifier<deliveryFee> deliveryFeechange = new ValueNotifier(new deliveryFee);
  int cartCount = 0;
  double subTotal = 0.0;
  int cashbackUsage=0;
  double total = 0.0;
  User user=new User();
  double distance = 0;
  GlobalKey<ScaffoldState> scaffoldKey;
  double base=0;
  double increament=0;
  String FeeStatus;
  double discount=0;
  int couponValidate=2;
  bool distanceValidity=true;

  CartController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    //  listenForCashback();
    //print("this start");
    // listenForCarts();
    // print("this end");
  }


  void listenForUser() {
    getCurrentUser().then((_user) {
      setState(() {
        user = _user;
      });
    });
  }

  Future<void> listenForCarts({String message}) async {
    print("this is cart controller get carts");
    carts.clear();
    final Stream<Cart> stream = await getCart();
    stream.listen((Cart _cart) {
      if (!carts.contains(_cart)) {
        setState(() {
          // coupon = _cart.food.applyCoupon(coupon);
          carts.add(_cart);
        });
      }
    }, onError: (a) {
      print(a);
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text("Verify your internet connection"),
      ));
    }, onDone: () {
      if (carts.isNotEmpty){
        calculateSubtotal();
      }
      if (message != null) {
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
      onLoadingCartDone();
    });
  }

  void onLoadingCartDone() {}

  void listenForCartsCount({String message}) async {
    final Stream<int> stream = await getCartCount();
    stream.listen((int _count) {
      setState(() {
        this.cartCount = _count;
      });
    }, onError: (a) {
      print(a);
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text("Verify your internet connection"),
      ));
    });
  }

  Future<void> refreshCarts() async {
    setState(() {
      carts = [];
    });
    listenForCarts(message: "Cart has been refreshed");
  }

  void removeFromCart(Cart _cart) async {
    setState(() {
      this.carts.remove(_cart);
    });
    removeCart(_cart).then((value) {
      calculateSubtotal();
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text("The food is removed from your cart"),
      ));
    });
  }

  void calculateSubtotal() async {
    double cartPrice = 0;
    subTotal = 0;
    carts.forEach((cart) {
      cartPrice = cart.product.price;
      cart.extras.forEach((element) {
        cartPrice += element.price;
      });
      cartPrice *= cart.quantity;
      subTotal += cartPrice;
    });

    print("this is cashback cart $cashbackUsage");
    total = subTotal +deliveryFee-cashbackUsage;
    setState(() {});
  }


  incrementQuantity(Cart cart) {
    if (cart.quantity <= 99) {
      ++cart.quantity;
      updateCart(cart);
      calculateSubtotal();
    }
  }

  decrementQuantity(Cart cart) {
    if (cart.quantity > 1) {
      --cart.quantity;
      updateCart(cart);
      calculateSubtotal();
    }
  }

  void goCheckout(BuildContext context) {
    if (!currentUser.value.profileCompleted()) {
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text("Fill your profile details to continue"),
        action: SnackBarAction(
          label: "Settings",
          textColor: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.of(context).pushNamed('/Settings');
          },
        ),
      ));
    } else {
      if (carts[0].product.dealer.closed) {
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text("Dealership is closed"),
        ));
      }
      else if(carts[0].product.deliverable==false){
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text("Product is not available"),
        ));
      }
      else {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DeliveryPickupWidget(routeArgument: RouteArgument(param: CartController()))));
      }
    }
  }


  void callFunction()async{
    await listenForCarts();
  }

}
