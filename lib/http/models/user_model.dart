import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:povarenok_mobile/entities/user.dart';
import 'package:povarenok_mobile/http/base_url.dart';
import 'package:http/http.dart' as http;

class UserModel extends ChangeNotifier {
  User _user = User.unauthorized();

  Future<bool> login(
      {required String username, required String password}) async {
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };
    final response =
        await http.post(Uri.parse('$trueURL/api/auth/login'), body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      _user =
          User.fromJson(json.decode(utf8.decode(response.bodyBytes))['data']);

      notifyListeners();

      return true;
    }

    return false;
  }

  Future<bool> register(
      {required String username,
      required String password,
      required String email}) async {
    final Map<String, String> body = {
      'username': username,
      'password': password,
      'email': email
    };
    final response =
        await http.post(Uri.parse('$trueURL/api/auth/register'), body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      _user = User(email: email, username: username, isAdmin: false);
      notifyListeners();

      return true;
    }

    return false;
  }

  //Future<void> logout() {}
}
