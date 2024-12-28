import 'package:flutter/material.dart';

import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/ui/components/menus/categories_menu_item.dart';
import 'package:provider/provider.dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var categoriesModel = Provider.of<CategoriesModel>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(categoriesModel.data.length,
          (i) => CategoriesMenuItem(categoryID: i)),
    );
  }
}
