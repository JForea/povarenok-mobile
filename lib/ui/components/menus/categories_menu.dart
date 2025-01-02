import 'package:flutter/material.dart';
import 'package:povarenok_mobile/entities/category.dart';

import 'package:povarenok_mobile/ui/components/menus/categories_menu_item.dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          categories.length, (i) => CategoriesMenuItem(categoryID: i)),
    );
  }
}
