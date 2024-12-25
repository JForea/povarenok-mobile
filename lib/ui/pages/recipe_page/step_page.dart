import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/entities/recipe_step.dart';

class StepPage extends StatelessWidget {
  final RecipeStep step;

  const StepPage({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          child: Row(),
        ),
      ),
    );
  }
}
