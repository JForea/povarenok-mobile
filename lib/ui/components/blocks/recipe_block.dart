import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/ui/components/buttons/like_button.dart';
import 'package:povarenok_mobile/ui/pages/recipe_page/chosen_recipe_page.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/entities/category.dart';
import 'package:povarenok_mobile/http/models/categories_model.dart';

class RecipeBlock extends StatelessWidget {
  final Recipe recipe;

  const RecipeBlock({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    JsonCategory category =
        Provider.of<CategoriesModel>(context).data[recipe.categoryID];
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChosenRecipePage(
                recipe: recipe,
              ))),
      child: Container(
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
                    height: 110.r,
                    width: 110.r,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            recipe.imageURL,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10.r)),
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
        ),
      ),
    );
  }
}
