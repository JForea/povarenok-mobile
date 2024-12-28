import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/ui/components/blocks/recipe_block.dart';
import 'package:povarenok_mobile/ui/components/buttons/category_switcher.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/ui/components/buttons/search_button.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoriesModel, RecipesModel>(
        builder: (context, categories, recipes, child) {
      if (categories.data.length == 1) {
        categories.update();
        recipes.update(categories.data[categories.currentCategory].id);
      }
      return SafeArea(
        child: Scaffold(
          appBar: const CustomAppbar(
            title: 'Рецепты',
            actions: [SearchButton()],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 10.w),
                    child: const CategorySwitcher(),
                  ),
                  Column(
                    children: List.generate(
                      recipes.data.length,
                      (i) => Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: RecipeBlock(
                          recipe: recipes.data[i],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
