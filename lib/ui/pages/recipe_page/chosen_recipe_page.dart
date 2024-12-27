import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/ui/components/buttons/page_switcher.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:povarenok_mobile/ui/components/sliders/page_slider.dart';
import 'package:povarenok_mobile/ui/pages/recipe_page/recipe_details_page.dart';
import 'package:povarenok_mobile/ui/pages/recipe_page/step_page.dart';

class ChosenRecipePage extends StatefulWidget {
  final Recipe recipe;

  const ChosenRecipePage({super.key, required this.recipe});

  @override
  State<ChosenRecipePage> createState() => _ChosenRecipePageState();
}

class _ChosenRecipePageState extends State<ChosenRecipePage> {
  List<Widget> pages = [];
  int currentIndex = 0;

  void updateIndex({int? id, bool? inc}) => setState(() {
        if (id != null && id >= 0 && id <= pages.length) {
          currentIndex = id;
        }
        if (inc != null) {
          if (inc && currentIndex < widget.recipe.steps.length) {
            currentIndex++;
          } else if (!inc && currentIndex > 0) {
            currentIndex--;
          }
        }
      });

  @override
  void initState() {
    super.initState();

    pages.add(RecipeDetailsPage(
      recipe: widget.recipe,
    ));
    for (var step in widget.recipe.steps) {
      pages.add(StepPage(step: step));
    }
  }

  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Рецепт'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              children: [
                Center(
                  child: pages[currentIndex],
                ),
                SizedBox(height: 12.h),
                PageSlider(
                  pageSwitch: updateIndex,
                  activeIndex: currentIndex,
                  length: widget.recipe.steps.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
