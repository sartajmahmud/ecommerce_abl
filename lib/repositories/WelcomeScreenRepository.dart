import 'dart:convert';

import 'package:grocery_app/helpers/custom_trace.dart';
import 'package:http/http.dart' as http;
import 'package:grocery_app/helpers/Helper.dart';
import 'package:grocery_app/models/WelcomeScreen.dart';

Future<Stream<WelcomeScreen>> getWelcome() async {
  Uri uri = Helper.getUri('api/welcomebanner');
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    print("this is slider $uri");
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => WelcomeScreen.fromJSON(data));
  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new WelcomeScreen.fromJSON({}));
  }
}