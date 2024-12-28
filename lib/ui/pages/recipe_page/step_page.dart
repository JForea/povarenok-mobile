import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/entities/recipe_step.dart';

class StepPage extends StatelessWidget {
  final String recipeTitle;
  final RecipeStep step;

  const StepPage({super.key, required this.recipeTitle, required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          children: [
            Container(
              width: 370.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  children: [
                    Text(
                      recipeTitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.h,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Шаг ${step.id}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 15.h),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 370.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                child: Text(
                  step.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 14.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
