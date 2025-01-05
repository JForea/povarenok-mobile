import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/entities/ingredient.dart';
import 'package:povarenok_mobile/entities/recipe.dart';
import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:povarenok_mobile/ui/components/buttons/custom_button.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:povarenok_mobile/ui/components/inputs/custom_input.dart';
import 'package:provider/provider.dart';

class IngredientInput {
  Ingredient ingredient;
  FocusNode focusName = FocusNode();
  FocusNode focusCount = FocusNode();

  IngredientInput(this.ingredient);
}

class RedactorPage extends StatefulWidget {
  const RedactorPage({super.key});

  @override
  State<RedactorPage> createState() => _RedactorPageState();
}

class _RedactorPageState extends State<RedactorPage> {
  Recipe recipe = Recipe.create();
  List<IngredientInput> ingredientInputs = [];

  FocusNode focusName = FocusNode();
  FocusNode focusUrl = FocusNode();
  FocusNode focusDescription = FocusNode();
  FocusNode focusTime = FocusNode();
  FocusNode focusManual = FocusNode();

  void unfocus() {
    focusName.unfocus();
    focusUrl.unfocus();
    focusDescription.unfocus();
    focusTime.unfocus();
    focusManual.unfocus();
    for (var ing in ingredientInputs) {
      ing.focusName.unfocus();
      ing.focusCount.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);
    var recipesModel = Provider.of<RecipesModel>(context);
    var categoriesModel = Provider.of<CategoriesModel>(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => unfocus(),
        child: Scaffold(
          appBar: const CustomAppbar(
            title: 'Шеф-поварёнок',
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    'Создание рецепта',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Название',
                    onChange: (s) => recipe.name = s,
                    obscureText: false,
                    expands: false,
                    focusNode: focusName,
                  ),
                  SizedBox(height: 12.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Ссылка на изображение',
                    onChange: (s) => recipe.img = s,
                    obscureText: false,
                    expands: false,
                    focusNode: focusUrl,
                  ),
                  SizedBox(height: 12.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Описание',
                    onChange: (s) => recipe.description = s,
                    obscureText: false,
                    expands: true,
                    focusNode: focusDescription,
                  ),
                  SizedBox(height: 12.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Время приготовления',
                    onChange: (s) {
                      if (s.isNotEmpty) {
                        recipe.time = int.parse(s);
                      } else {
                        recipe.time = null;
                      }
                    },
                    obscureText: false,
                    expands: false,
                    keyboardType: TextInputType.number,
                    focusNode: focusTime,
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ингредиенты',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 17.h,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      TextButton.icon(
                        onPressed: () => setState(
                          () => ingredientInputs.add(
                            IngredientInput(Ingredient(name: '', count: '')),
                          ),
                        ),
                        label: Icon(
                          CupertinoIcons.add,
                          size: 28.r,
                        ),
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          fixedSize: Size.fromRadius(28.r),
                        ),
                      ),
                    ],
                  ),
                  for (var ingredientInput in ingredientInputs)
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomInput(
                            title: 'Название',
                            onChange: (s) =>
                                ingredientInput.ingredient.name = s,
                            obscureText: false,
                            focusNode: ingredientInput.focusName,
                            expands: false,
                            width: 160.w,
                          ),
                          SizedBox(width: 10.w),
                          CustomInput(
                            title: 'Количество',
                            onChange: (s) =>
                                ingredientInput.ingredient.count = s,
                            obscureText: false,
                            focusNode: ingredientInput.focusCount,
                            expands: false,
                            width: 160.w,
                          ),
                          SizedBox(width: 5.w),
                          TextButton.icon(
                            onPressed: () => setState(
                              () => ingredientInputs.remove(ingredientInput),
                            ),
                            label: Icon(
                              CupertinoIcons.trash,
                              size: 26.r,
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              fixedSize: Size.fromRadius(28.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 18.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Способ приготовления',
                    onChange: (s) => recipe.manual = s,
                    obscureText: false,
                    expands: true,
                    focusNode: focusManual,
                  ),
                  SizedBox(height: 36.h),
                  CustomButton(
                    innerColor: true,
                    onTap: () async {
                      List<Ingredient> ingredients = [];
                      for (var ingredientInput in ingredientInputs) {
                        ingredients.add(ingredientInput.ingredient);
                      }
                      recipe.ingredients = ingredients;
                      await userModel.addRecipe(recipe);
                      recipesModel.update(categoriesModel.currentCategory);
                    },
                    title: 'Создать',
                    border: false,
                  ),
                  SizedBox(height: 36.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
