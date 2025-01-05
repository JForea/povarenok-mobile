import 'package:flutter/material.dart';
import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:povarenok_mobile/ui/components/list_views/recipe_list.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/ui/components/buttons/search_button.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<RecipesModel, CategoriesModel>(
      builder: (context, recipes, categories, child) {
        if (!recipes.loaded) {
          recipes.update(categories.currentCategory);
        }
        return SafeArea(
          child: Scaffold(
            appBar: const CustomAppbar(
              title: 'Шеф-поварёнок',
              actions: [SearchButton()],
            ),
            body: SingleChildScrollView(
              child: RecipeList(recipeIds: recipes.recipeIds),
            ),
          ),
        );
      },
    );
  }
}
