import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:povarenok_mobile/entities/category.dart';

import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/http/base_url.dart';

Map<int, JsonCategory> idCategory = {
  0: const JsonCategory(id: 0, title: '', color: 0xFFFFFFFF),
  1: const JsonCategory(id: 1, title: 'Салат', color: 0xFF00AB00),
  2: const JsonCategory(id: 2, title: 'Первое блюдо', color: 0xFFFF4F4F),
  3: const JsonCategory(id: 3, title: 'Второе блюдо', color: 0xFF006BB8),
  4: const JsonCategory(id: 4, title: 'Десерт', color: 0xFFFF47A6),
  5: const JsonCategory(id: 5, title: 'Выпечка', color: 0xFFE28400),
  6: const JsonCategory(id: 6, title: 'Закуска', color: 0xFF4BB593),
};

class RecipesModel extends ChangeNotifier {
  List<Recipe> _recipesAll = [];
  List<Recipe> _recipes = [];
  bool loaded = false;

  UnmodifiableListView<Recipe> get data => UnmodifiableListView(_recipes);

  void _syncWithCategory(int categoryID) {
    if (categoryID == 0) {
      _recipes = _recipesAll;
    } else {
      _recipes.clear();
      for (var r in _recipesAll) {
        if (r.categoryID == categoryID) {
          _recipes.add(r);
        }
      }
    }
  }

  Future<void> update(categoryID) async {
    String req = '$trueURL/api/recipe';

    final response = await http.get(Uri.parse(req));

    if (response.statusCode == 200) {
      _recipesAll = List<Recipe>.from(json
          .decode(utf8.decode(response.bodyBytes))['data']
          .map((x) => Recipe.fromJson(x))).toList();
      _syncWithCategory(categoryID);
      loaded = true;
      notifyListeners();
    }
  }
}
