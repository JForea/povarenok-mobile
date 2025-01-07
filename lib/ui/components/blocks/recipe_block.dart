import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/ui/components/buttons/like_button.dart';
import 'package:povarenok_mobile/ui/pages/recipe_page/chosen_recipe_page.dart';

import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/utilts/convert_time.dart';

class RecipeBlock extends StatelessWidget {
  final Recipe recipe;

  const RecipeBlock({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl: recipe.img,
                      fit: BoxFit.fill,
                      height: 110.r,
                      width: 110.r,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 9.h, right: 10.w),
                        child: Text(
                          recipe.name,
                          style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSecondary,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(
                        idCategory[recipe.category] != null
                            ? idCategory[recipe.category]!.title
                            : '',
                        style: TextStyle(
                          fontSize: 12.h,
                          color: Color(idCategory[recipe.category] != null
                              ? idCategory[recipe.category]!.color
                              : 0),
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
                        'Около ${convertTime(recipe.time!)}',
                        style: TextStyle(
                          fontSize: 11.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 93.h, left: 340.w),
              child: LikeButton(recipe.id!),
            )
          ],
        ),
      ),
    );
  }
}
