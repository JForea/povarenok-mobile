import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/entities/recipe_step.dart';

class StepPage extends StatelessWidget {
  final RecipeStep step;

  const StepPage({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
