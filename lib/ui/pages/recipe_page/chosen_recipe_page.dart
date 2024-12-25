import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/ui/components/blocks/recipe_block_details.dart';
import 'package:povarenok_mobile/ui/components/buttons/custom_button.dart';
import 'package:povarenok_mobile/ui/components/buttons/page_switcher.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';

class ChosenRecipePage extends StatefulWidget {
  final Recipe recipe;

  const ChosenRecipePage({super.key, required this.recipe});

  @override
  State<ChosenRecipePage> createState() => _ChosenRecipePageState();
}

class _ChosenRecipePageState extends State<ChosenRecipePage> {
  List<Widget> steps = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    steps = [
      RecipeBlockDetails(
        recipe: widget.recipe,
      ),
    ];
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
                  child: steps[0],
                ),
                SizedBox(height: 12.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, right: 6),
                    child: Row(
                      children: [
                        for (var step in widget.recipe.steps)
                          Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: PageSwitcher(
                                onTap: () =>
                                    setState(() => currentIndex = step.id),
                                index: step.id,
                                isActive: currentIndex == step.id),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
