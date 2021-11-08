import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:grocery_app/helpers/custom_trace.dart';
import 'package:grocery_app/models/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<User> currentUser = new ValueNotifier(User());

Future<User> login(User user) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}login';
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.toMap()),
  );
  print("This is login $url");
  print("This is login body ${json.encode(user.toMap())}");
  print("this is login response ${response.body}");
  if (response.statusCode == 200) {
    setCurrentUser(response.body);
    currentUser.value = User.fromJSON(json.decode(response.body)['data']);
  } else {
    print(CustomTrace(StackTrace.current, message: response.body).toString());
    throw new Exception(response.body);
  }
  return currentUser.value;
}

Future<void> logout() async {
  currentUser.value = new User();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('current_user');
}

Future<User> register(User user) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}register';
  final client = new http.Client();

  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.toMap()),
  );
  print("This is Register $url");
  print("This is Register body ${json.encode(user.toMap())}");
  print("this is Register response ${response.body}");
  if (response.statusCode == 200) {
    setCurrentUser(response.body);
    currentUser.value = User.fromJSON(json.decode(response.body)['data']);
  } else {
    print(CustomTrace(StackTrace.current, message: response.body).toString());
    throw new Exception(response.body);
  }
  return currentUser.value;
}

void setCurrentUser(jsonString) async {
  print("this is current user ");
  try {
    if (json.decode(jsonString)['data'] != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('current_user', json.encode(json.decode(jsonString)['data']));
    }
  } catch (e) {
    print("this is current user catch");
    print(CustomTrace(StackTrace.current, message: jsonString).toString());
    throw new Exception(e);
  }
}

Future<User> getCurrentUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.clear();
  if (currentUser.value.auth == null && prefs.containsKey('current_user')) {
    currentUser.value = User.fromJSON(json.decode(await prefs.get('current_user')));
    currentUser.value.auth = true;
  } else {
    currentUser.value.auth = false;
  }
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  currentUser.notifyListeners();
  return currentUser.value;
}

Future<User> update(User user) async {
  final String _apiToken = 'api_token=${currentUser.value.apiToken}';
  final String url = '${GlobalConfiguration().getValue('api_base_url')}users/${currentUser.value.id}?$_apiToken';
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.toMap()),
  );
  print("this is update user $url");
  print("this is update user body ${json.encode(user.toMap())}");
  print("this is update user response body ${response.body}");
  setCurrentUser(response.body);
  currentUser.value = User.fromJSON(json.decode(response.body)['data']);
  return currentUser.value;
}

Future<String> GetResetPass(User user) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}users/reset-password';
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.ResetPasswordMap()),
  );
  print("This is reset $url");
  print("This is reset body ${json.encode(user.ResetPasswordMap())}");
  print("this is reset response ${response.body}");
  print("this is reset response ${jsonDecode(response.body)['message']}");
  print("statuscode: ${response.statusCode}");
  //if (response.statusCode == 200) {
  return jsonDecode(response.body)['message'];
  //setCurrentUser(response.body);
  //currentUser.value = User.fromJSON(json.decode(response.body)['data']);
  // } else {
  //   print(CustomTrace(StackTrace.current, message: response.body).toString());
  //   throw new Exception(response.body);
  // }
  // return currentUser.value;
}

Future<bool> GetDuplicateAC(User user) async {
  final String url = '${GlobalConfiguration().getValue('api_base_url')}users/duplicate-ac';
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.DuplicateACMap()),
  );
  print("This is duplicate $url");
  print("This is duplicate body ${json.encode(user.DuplicateACMap())}");
  print("this is duplicate response ${response.body}");
  print("this is duplicate response ${jsonDecode(response.body)['success']}");
  if (response.statusCode == 200 || response.statusCode==404) {
    print("duplicate repository ${jsonDecode(response.body)['success']}");
    return jsonDecode(response.body)['success'];
    //setCurrentUser(response.body);
    //currentUser.value = User.fromJSON(json.decode(response.body)['data']);
  }
  // else {
  //   print(CustomTrace(StackTrace.current, message: response.body).toString());
  //   throw new Exception(response.body);
  // }
  // return currentUser.value;
}