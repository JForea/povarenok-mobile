import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:povarenok_mobile/entities/category.dart';
import 'package:povarenok_mobile/http/base_url.dart';

class CategoriesModel extends ChangeNotifier {
  final List<JsonCategory> _categories = [
    const JsonCategory(id: 0, title: 'Все рецепты', color: 0x00000000)
  ];
  int currentCategory = 0;

  UnmodifiableListView<JsonCategory> get data =>
      UnmodifiableListView(_categories);

  Future<void> update() async {
    final response = await http.get(Uri.parse('$baseURL/categories'));

    if (response.statusCode == 200) {
      _categories.addAll(List<JsonCategory>.from(json
          .decode(utf8.decode(response.bodyBytes))
          .map((x) => JsonCategory.fromJson(x))));
      notifyListeners();
    }
  }

  void switchCategory(int i) {
    currentCategory = i;
    notifyListeners();
  }
}
