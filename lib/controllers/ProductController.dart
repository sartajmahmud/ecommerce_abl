import 'package:flutter/material.dart';
import 'package:grocery_app/models/Cart.dart';
import 'package:grocery_app/models/Product.dart';
import 'package:grocery_app/repositories/CartRepository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ProductController extends ControllerMVC {
  Product product;
  double quantity = 1;
  double total = 0;
  List<Cart> carts = [];
  bool loadCart = false;
  GlobalKey<ScaffoldState> scaffoldKey;

  ProductController(){
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  bool isSameSeller(Product product) {
    if (carts.isNotEmpty) {
      //return carts[0].product?.seller?.id == product.seller?.id;
    }
    return true;
  }

  void addToCart(Product product, {bool reset = false}) async {
    setState(() {
      this.loadCart = true;
    });
    var _newCart = new Cart();
    _newCart.product = product;
    _newCart.quantity = this.quantity;
    // if food exist in the cart then increment quantity
    var _oldCart = isExistInCart(_newCart);
    if (_oldCart != null) {
      _oldCart.quantity += this.quantity;
      updateCart(_oldCart).then((value) {
        setState(() {
          this.loadCart = false;
        });
      }).whenComplete(() {
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text("Product is added to the cart"),
        ));
      });
    } else {
      // the food doesnt exist in the cart add new one
      addCart(_newCart, reset).then((value) {
        setState(() {
          this.loadCart = false;
        });
      }).whenComplete(() {
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text("Product is added to the cart"),
        ));
      });
    }
  }

  Cart isExistInCart(Cart _cart) {
    return carts.firstWhere((Cart oldCart) => _cart.isSame(oldCart), orElse: () => null);
  }

}