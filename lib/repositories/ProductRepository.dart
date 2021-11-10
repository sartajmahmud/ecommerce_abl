import 'package:global_configuration/global_configuration.dart';
import 'package:grocery_app/helpers/Helper.dart';
import 'package:grocery_app/helpers/custom_trace.dart';
import 'package:grocery_app/models/Address.dart';
import 'package:grocery_app/models/Product.dart';
import 'package:grocery_app/models/Review.dart';
import 'package:http/http.dart' as http;
import 'UserRepository.dart' as userRepo;
import 'dart:convert';
import 'dart:io';


Future<Stream<Product>> searchProducts(String search, Address address, String MinPrice,String MaxPrice) async {
  Uri uri = Helper.getUri('api/products');
  Map<String, dynamic> _queryParams = {};
  _queryParams['search'] = 'name:$search;description:$search';
  _queryParams['searchFields'] = 'name:like;description:like';
  _queryParams['limit'] = '10';
  //_queryParams['zone_id'] = '${selectedzone.value.id}';
  if(MinPrice!=null && MaxPrice!=null){
    _queryParams['from_price'] = '$MinPrice';
    _queryParams['to_price'] = '$MaxPrice';
  }

  //  if (!address.isUnknown()) {
  //    _queryParams['myLon'] = address.longitude.toString();
  //    _queryParams['myLat'] = address.latitude.toString();
  //    _queryParams['areaLon'] = address.longitude.toString();
  //    _queryParams['areaLat'] = address.latitude.toString();
  //  }
  uri = uri.replace(queryParameters: _queryParams);
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    print("search product $uri");
    return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).expand((data) => (data as List)).map((data) {
      return Product.fromJSON(data);
    });
  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new Product.fromJSON({}));
  }
}

Future<Review> addProductReview(Review review, Product product) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}product_reviews';
  final client = new http.Client();
  review.user = userRepo.currentUser.value;
  try {
    final response = await client.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(review.ofProductToMap(product)),
    );
    if (response.statusCode == 200) {
      return Review.fromJSON(json.decode(response.body)['data']);
    } else {
      print(CustomTrace(StackTrace.current, message: response.body).toString());
      return Review.fromJSON({});
    }
  } catch (e) {
    print(CustomTrace(StackTrace.current, message: url).toString());
    return Review.fromJSON({});
  }
}