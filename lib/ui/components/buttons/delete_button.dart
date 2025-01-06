import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatelessWidget {
  final int recipeId;

  void showDeleteDialog(BuildContext context) {
    var userModel = Provider.of<UserModel>(context, listen: false);
    var recipesModel = Provider.of<RecipesModel>(context, listen: false);
    var categoriesModel = Provider.of<CategoriesModel>(context, listen: false);
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withAlpha(128),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 200.h,
            width: 370.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Вы уверены, что хотите удалить этот рецепт?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.8.h,
                      color: Colors.black,
                      fontFamily: 'Comfortaa',
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Отмена',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                      SizedBox(width: 100.w),
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          await userModel.deleteRecipe(recipeId);
                          recipesModel.update(categoriesModel.currentCategory);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7259),
                        ),
                        child: const Text(
                          'Удалить',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  const DeleteButton({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        showDeleteDialog(context);
        // Navigator.of(context).pop();
        // await userModel.deleteRecipe(recipeId);
        // recipesModel.update(categoriesModel.currentCategory);
      },
      icon: Icon(
        CupertinoIcons.trash,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 32.r,
      ),
    );
  }
}
