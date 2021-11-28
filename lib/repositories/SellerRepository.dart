import 'dart:convert';
import 'dart:io';
import 'package:global_configuration/global_configuration.dart';
import 'package:grocery_app/helpers/custom_trace.dart';
import 'package:grocery_app/models/Seller.dart';
import 'package:grocery_app/models/Review.dart';
import 'package:http/http.dart' as http;
import 'package:grocery_app/repositories/UserRepository.dart';

Future<Review> addSellerReview(Review review, Seller seller) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}restaurant_reviews';
  final client = new http.Client();
  review.user = currentUser.value;
  try {
    final response = await client.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(review.ofSellerToMap(seller)),
    );
    print("this is add restaurant review $url");
    print("this is add restaurant review body ${json.encode(review.ofSellerToMap(seller))}");
    print("this is add restaurant review response body $response");
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