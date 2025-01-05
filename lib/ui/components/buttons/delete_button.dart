import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatelessWidget {
  final int recipeId;

  const DeleteButton({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);
    var recipesModel = Provider.of<RecipesModel>(context);
    var categoriesModel = Provider.of<CategoriesModel>(context);
    return IconButton(
      onPressed: () async {
        Navigator.of(context).pop();
        await userModel.deleteRecipe(recipeId);
        recipesModel.update(categoriesModel.currentCategory);
      },
      icon: Icon(
        CupertinoIcons.trash,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 32.r,
      ),
    );
  }
}
