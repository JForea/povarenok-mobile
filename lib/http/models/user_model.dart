import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/entities/user.dart';
import 'package:povarenok_mobile/http/base_url.dart';
import 'package:http/http.dart' as http;

class UserModel extends ChangeNotifier {
  User _user = User.unauthorized();

  User get data => _user;

  Future<bool> login(
      {required String username, required String password}) async {
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };
    final response =
        await http.post(Uri.parse('$baseURL/api/auth/login'), body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      _user =
          User.fromJson(json.decode(utf8.decode(response.bodyBytes))['data']);
      _user.isAuthorized = true;

      _user.token = response.headers['set-cookie'] ?? '';

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
        await http.post(Uri.parse('$baseURL/api/auth/register'), body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      _user = User(email: email, username: username, isAdmin: false);
      _user.token = response.headers['set-cookie'] ?? '';

      notifyListeners();

      return true;
    }

    return false;
  }

  Future<bool> updateProfileInfo() async {
    Map<String, String> headers = {'Cookie': _user.token};
    final response = await http.get(Uri.parse('$baseURL/api/user/profile'),
        headers: headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes))['data'];

      for (var r in jsonData['recipes']) {
        _user.recipes.add(r['id'] as int);
      }
      for (var r in jsonData['favourites']) {
        _user.favourites.add(r['id'] as int);
      }

      _user.infoUpdated = true;

      notifyListeners();
      return true;
    }

    return false;
  }

  Future<void> addToFavourite(int id) async {
    Map<String, String> headers = {'Cookie': _user.token};
    final response = await http
        .post(Uri.parse('$baseURL/api/recipe/$id/favourite'), headers: headers);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (_user.favourites.contains(id)) {
        _user.favourites.remove(id);
      } else {
        _user.favourites.add(id);
      }

      notifyListeners();
    }
  }

  Future<bool> addRecipe(Recipe recipe) async {
    var body = recipe.toJson();
    Map<String, String> headers = {'Cookie': _user.token};
    var response = await http.post(
      Uri.parse('$baseURL/api/recipe'),
      body: body,
      headers: headers,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    }

    return false;
  }

  Future<void> deleteRecipe(int recipeId) async {
    Map<String, String> headers = {'Cookie': _user.token};
    await http.delete(
      Uri.parse('$baseURL/api/recipe/$recipeId'),
      headers: headers,
    );
  }

  //Future<void> logout() {}
}
