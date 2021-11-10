import 'package:grocery_app/models/Order.dart';
import 'package:grocery_app/models/User.dart';
import 'package:grocery_app/repositories/UserRepository.dart' as userRepo;
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:grocery_app/helpers/Helper.dart';


Future<Stream<Order>> getOrder(orderId) async {
  User _user = userRepo.currentUser.value;
  if (_user.apiToken == null) {
    return new Stream.value(null);
  }
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}orders/$orderId?${_apiToken}with=user;foodOrders;foodOrders.food;foodOrders.extras;orderStatus;deliveryAddress;payment';
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));
  print("user specic order details using order id $url");
  return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).map((data) {
    return Order.fromJSON(data);
  });
}