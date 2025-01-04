import 'package:flutter/material.dart';
import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:povarenok_mobile/ui/components/buttons/search_button.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:povarenok_mobile/ui/components/list_views/recipe_list.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<RecipesModel, CategoriesModel, UserModel>(
      builder: (context, recipes, categories, user, child) {
        if (!recipes.loaded) {
          recipes.update(categories.currentCategory);
        }
        if (user.data.isAuthorized && !user.data.infoUpdated) {
          user.updateProfileInfo();
        }
        return SafeArea(
          child: Scaffold(
            appBar: const CustomAppbar(
              title: 'Шеф-поварёнок',
              actions: [SearchButton()],
            ),
            body: RecipeList(recipeIds: user.data.favourites),
          ),
        );
      },
    );
  }
}
