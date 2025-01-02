import 'package:flutter/material.dart';

class CategoriesModel extends ChangeNotifier {
  int currentCategory = 0;

  void switchCategory(int i) {
    currentCategory = i;
    notifyListeners();
  }
}
