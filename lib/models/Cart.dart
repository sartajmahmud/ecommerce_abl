import 'package:grocery_app/models/Extra.dart';
import 'package:grocery_app/models/Product.dart';

class Cart {
  String id;
  Product product;
  double quantity;
  List<Extra> extras;
  String userId;

  Cart();

  Cart.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      quantity =
      jsonMap['quantity'] != null ? jsonMap['quantity'].toDouble() : 0.0;
      product =
      jsonMap['product'] != null ? Product.fromJSON(jsonMap['product']) : Product.fromJSON(
          {});
      extras =
      jsonMap['extras'] != null ? List.from(jsonMap['extras']).map((element) =>
          Extra.fromJSON(element)).toList() : [];
    } catch (e) {
      id = '';
      quantity = 0.0;
      product = Product.fromJSON({});
      extras = [];
      //print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["quantity"] = quantity;
    map["product_id"] = product.id;
    map["user_id"] = userId;
    map["extras"] = extras.map((element) => element.id).toList();
    return map;
  }

  double getProductPrice() {
    double result = product.price;
    if (extras.isNotEmpty) {
      extras.forEach((Extra extra) {
        result += extra.price != null ? extra.price : 0;
      });
    }
    return result;
  }

  bool isSame(Cart cart) {
    bool _same = true;
    _same &= this.product == cart.product;
    _same &= this.extras.length == cart.extras.length;
    if (_same) {
      this.extras.forEach((Extra _extra) {
        _same &= cart.extras.contains(_extra);
      });
    }
    return _same;
  }

  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }

  @override
  int get hashCode => this.id.hashCode;
}