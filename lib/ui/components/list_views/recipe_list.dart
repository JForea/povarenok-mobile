import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:povarenok_mobile/ui/components/blocks/recipe_block.dart';
import 'package:povarenok_mobile/ui/components/buttons/category_switcher.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  final List<int> recipeIds;

  const RecipeList({super.key, required this.recipeIds});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<RecipesModel, UserModel>(
      builder: (context, recipes, user, child) {
        return SingleChildScrollView(
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
                    widget.recipeIds.length,
                    (i) => Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: RecipeBlock(
                        recipe: recipes.getRecipe(widget.recipeIds[i])!,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
