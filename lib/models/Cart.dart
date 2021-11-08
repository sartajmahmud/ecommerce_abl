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
}