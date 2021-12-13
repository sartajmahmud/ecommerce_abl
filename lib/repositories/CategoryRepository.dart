
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/Helper.dart';
import '../helpers/custom_trace.dart';
import '../models/Category.dart';
import '../models/Category.dart';
import '../models/Product.dart';
import '../models/Product.dart';

Future<Stream<Category>> getCategory() async {
  Uri uri = Helper.getUri('api/allcategories');
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    print("this is slider $uri");
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => Category.fromJSON(data));

  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new Category.fromJSON({}));
  }
}

Future<Stream<Product>> getCategoryProducts(String id) async {
  Uri uri = Helper.getUri('api/categoryproduct/'+id);
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    print("this is slider $uri");
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => Product.fromJSON(data));

  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new Product.fromJSON({}));
  }
}