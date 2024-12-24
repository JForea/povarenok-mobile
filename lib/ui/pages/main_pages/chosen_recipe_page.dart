import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/ui/components/blocks/recipe_block_details.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';

class ChosenRecipePage extends StatelessWidget {
  final Recipe recipe;

  const ChosenRecipePage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Рецепт'),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 12.r),
            child: Column(
              children: [
                RecipeBlockDetails(
                  recipe: recipe,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
