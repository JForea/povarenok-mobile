import 'package:flutter/material.dart';
import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:povarenok_mobile/ui/components/buttons/search_button.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:povarenok_mobile/ui/components/list_views/recipe_list.dart';
import 'package:povarenok_mobile/ui/pages/main_pages/unauthorized_page.dart';
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
        List<int> favrs = [];
        if (categories.currentCategory == 0) {
          favrs.addAll(user.data.favourites);
        } else {
          for (var favId in user.data.favourites) {
            if (recipes.getRecipe(favId)!.category ==
                categories.currentCategory) {
              favrs.add(favId);
            }
          }
        }
        if (!recipes.loaded) {
          recipes.update(categories.currentCategory);
        }
        if (user.data.isAuthorized && !user.data.infoUpdated) {
          user.updateProfileInfo();
        }
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppbar(
              title: 'Шеф-поварёнок',
              actions: [if (user.data.isAuthorized) const SearchButton()],
            ),
            body: user.data.isAuthorized
                ? SingleChildScrollView(
                    child: RecipeList(recipeIds: favrs),
                  )
                : const UnauthorizedPage(),
          ),
        );
      },
    );
  }
}
