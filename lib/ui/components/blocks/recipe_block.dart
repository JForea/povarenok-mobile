import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/ui/components/buttons/like_button.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/entities/category.dart';
import 'package:povarenok_mobile/models/categories_model.dart';

class RecipeBlock extends StatelessWidget {
  final Recipe recipe;

  const RecipeBlock({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    JsonCategory category =
        Provider.of<CategoriesModel>(context).data[recipe.categoryID];
    return Container(
        height: 130.h,
        width: 380.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.r, right: 15),
                  child: Container(
                    width: 110.h,
                    height: 110.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 9.h),
                      child: Text(
                        recipe.title,
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                    Text(
                      category.title,
                      style: TextStyle(
                        fontSize: 12.h,
                        color: Color(category.color),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Время приготовления:',
                      style: TextStyle(
                        fontSize: 11.h,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Около ${recipe.time} минут',
                      style: TextStyle(
                        fontSize: 11.h,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 93.h, left: 300.w),
              child: LikeButton(number: recipe.likes),
            )
          ],
        ));
  }
}
