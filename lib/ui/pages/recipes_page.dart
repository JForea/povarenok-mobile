import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/ui/components/buttons/category_switcher.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/models/categories_model.dart';
import 'package:povarenok_mobile/ui/components/buttons/search_button.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesModel>(builder: (context, categories, child) {
      if (categories.data.length == 1) {
        categories.update();
      }
      return SafeArea(
        child: Scaffold(
          appBar: const CustomAppbar(
            title: 'Рецепты',
            actions: [SearchButton()],
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 15.w),
                child: const CategorySwitcher(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
