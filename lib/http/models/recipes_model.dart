import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/http/base_url.dart';

class RecipesModel extends ChangeNotifier {
  List<Recipe> _recipes = [];

  UnmodifiableListView<Recipe> get data => UnmodifiableListView(_recipes);

  Future<void> update(categoryId) async {
    String req =
        '$baseURL/recipes${categoryId == 0 ? '' : '?categoryID=$categoryId'}';

    final response = await http.get(Uri.parse(req));

    if (response.statusCode == 200) {
      _recipes = List<Recipe>.from(json
          .decode(utf8.decode(response.bodyBytes))
          .map((x) => Recipe.fromJson(x)));
      notifyListeners();
    }
  }
}
