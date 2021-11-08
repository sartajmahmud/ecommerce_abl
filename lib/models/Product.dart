import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/Dealer.dart';
import 'package:grocery_app/models/Extra.dart';
import 'package:grocery_app/models/ExtraGroup.dart';
import 'package:grocery_app/models/Media.dart';
import 'package:grocery_app/models/Review.dart';

class Product {
  String id;
  String name;
  double price;
  double discountPrice;
  Media image;
  String description;

  // String ingredients;
  // String weight;
//  String unit;
//  String packageItemsCount;
  // bool featured;
  bool deliverable;
  Dealer dealer;
  Category category;
  List<Extra> extras;
  List<ExtraGroup> extraGroups;
  List<Review> foodReviews;
  double deliveryfee;
  //offer offerDetails;
  int offerValidity = 0;
  double discount;

  Product();

  Product.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      name = jsonMap['name'];
      price = jsonMap['price'] != null ? jsonMap['price'].toDouble() : 0.0;
      deliveryfee = jsonMap['delivery_fee'] != null ? double.parse(
          jsonMap['delivery_fee'].toString()) : -1;
      discountPrice = jsonMap['discount_price'] != null
          ? jsonMap['discount_price'].toDouble()
          : 0.0;
      discount = jsonMap['discount'] != null
          ? double.parse(jsonMap['discount'].toString())
          : 0.0;
      //price = discountPrice != 0 ? discountPrice : price;
      //discountPrice = discountPrice == 0 ? discountPrice : jsonMap['price'] != null ? jsonMap['price'].toDouble() : 0.0;
      description = jsonMap['description'];
      // ingredients = jsonMap['ingredients'];
      // weight = jsonMap['weight'] != null ? jsonMap['weight'].toString() : '';
      // unit = jsonMap['unit'] != null ? jsonMap['unit'].toString() : '';
      // packageItemsCount = jsonMap['package_items_count'].toString();
      // featured = jsonMap['featured'] ?? false;
      deliverable = jsonMap['deliverable'] ?? false;
      dealer = jsonMap['restaurant'] != null
          ? Dealer.fromJSON(jsonMap['restaurant'])
          : Dealer.fromJSON({});
      // if (jsonMap['offer'] != null) {
      //   offerDetails = offer.fromJSON(jsonMap['offer']);
      //   print("this is max ${offerDetails.MaxQuantity}");
      //   offerValidity = 1;
      // }
      //  offerDetails = jsonMap['offer'] != null ? offer.fromJSON(jsonMap['offer']) : offer.fromJSON({});
      category = jsonMap['category'] != null
          ? Category.fromJSON(jsonMap['category'])
          : Category.fromJSON({});
      image =
      jsonMap['media'] != null && (jsonMap['media'] as List).length > 0
          ? Media.fromJSON(
          (jsonMap['media'][(jsonMap['media'] as List).length - 1]))
          : new Media();
      extras =
      jsonMap['extras'] != null && (jsonMap['extras'] as List).length > 0
          ? List.from(jsonMap['extras']).map((element) =>
          Extra.fromJSON(element)).toSet().toList()
          : [];
      extraGroups = jsonMap['extra_groups'] != null &&
          (jsonMap['extra_groups'] as List).length > 0
          ? List.from(jsonMap['extra_groups']).map((element) =>
          ExtraGroup.fromJSON(element)).toSet().toList()
          : [];
      foodReviews = jsonMap['food_reviews'] != null &&
          (jsonMap['food_reviews'] as List).length > 0
          ? List.from(jsonMap['food_reviews']).map((element) =>
          Review.fromJSON(element)).toSet().toList()
          : [];
    } catch (e) {
      id = '';
      name = '';
      price = 0.0;
      discountPrice = 0.0;
      description = '';
      deliveryfee = -1;
      offerValidity = 1;
      // weight = '';
      // ingredients = '';
      // unit = '';
      // packageItemsCount = '';
      // featured = false;
      deliverable = false;
      dealer = Dealer.fromJSON({});
      category = Category.fromJSON({});
      //offerDetails = offer.fromJSON({});
      image = new Media();
      extras = [];
      extraGroups = [];
      foodReviews = [];
      //print(CustomTrace(StackTrace.current, message: e));
    }
  }
  double getRate() {
    double _rate = 0;
    foodReviews.forEach((e) => _rate += double.parse(e.rate));
    _rate = _rate > 0 ? (_rate / foodReviews.length) : 0;
    return _rate;
  }

  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }

  @override
  int get hashCode => this.id.hashCode;
}