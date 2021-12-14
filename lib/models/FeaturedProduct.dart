import 'package:grocery_app/models/Product.dart';

class FeaturedProduct {

  String id;
  String product_id;
  String priority;
  Product product;

  FeaturedProduct();

  FeaturedProduct.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      product_id = jsonMap['product_id'].toString();
      priority = jsonMap['priority'].toString();
      product = jsonMap['product'] != null ? Product.fromJSON(jsonMap['product']) : Product.fromJSON({});
    } catch (e) {
      id = '';
      product_id = '';
      product = new Product();
    }
  }
}