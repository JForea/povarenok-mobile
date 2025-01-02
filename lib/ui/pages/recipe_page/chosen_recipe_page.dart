import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:povarenok_mobile/ui/pages/recipe_page/recipe_details_page.dart';

class ChosenRecipePage extends StatefulWidget {
  final Recipe recipe;

  const ChosenRecipePage({super.key, required this.recipe});

  @override
  State<ChosenRecipePage> createState() => _ChosenRecipePageState();
}

class _ChosenRecipePageState extends State<ChosenRecipePage> {
  // void updateIndex({int? id, bool? inc}) => setState(() {
  //       if (id != null && id >= 0 && id <= pages.length) {
  //         currentIndex = id;
  //       }
  //       if (inc != null) {
  //         if (inc && currentIndex < widget.recipe.steps.length) {
  //           currentIndex++;
  //         } else if (!inc && currentIndex > 0) {
  //           currentIndex--;
  //         }
  //       }
  //     });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Рецепт'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              children: [
                Center(
                  child: RecipeDetailsPage(recipe: widget.recipe),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
