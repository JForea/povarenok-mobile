import 'dart:math';

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
import 'package:povarenok_mobile/ui/components/modals/create_notification.dart';
import 'package:povarenok_mobile/ui/pages/main_pages/unauthorized_page.dart';
import 'package:provider/provider.dart';

class IngredientInput {
  FocusNode focusName = FocusNode();
  FocusNode focusCount = FocusNode();

  final nameController = TextEditingController();
  final countController = TextEditingController();

  int nameStatus = 0;
  int countStatus = 0;

  IngredientInput();
}

class RedactorPage extends StatefulWidget {
  const RedactorPage({super.key});

  @override
  State<RedactorPage> createState() => _RedactorPageState();
}

class _RedactorPageState extends State<RedactorPage> {
  //Recipe recipe = Recipe.create();
  List<IngredientInput> ingredientInputs = [];
  bool noIngredients = false;

  FocusNode focusName = FocusNode();
  FocusNode focusUrl = FocusNode();
  FocusNode focusDescription = FocusNode();
  FocusNode focusTime = FocusNode();
  FocusNode focusManual = FocusNode();

  final nameController = TextEditingController();
  final urlController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();
  final manualController = TextEditingController();

  int nameStatus = 0;
  int urlStatus = 0;
  int descriptionStatus = 0;
  int timeStatus = 0;
  int manualStatus = 0;

  Map<int, String?> nameMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Название не может быть длиннее 128 символов',
  };

  Map<int, String?> urlMessages = {
    0: null,
    1: 'Ссылка не может быть длиннее 512 символов',
  };

  Map<int, String?> descriptionMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Описание не может быть длиннее 2048 символов',
  };

  Map<int, String?> manualMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Приготовление не может быть длиннее 2048 символов',
  };

  Map<int, String?> timeMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Время приготовления не может быть настолько большим',
  };

  Map<int, String?> ingredientMessages = {
    0: null,
    1: 'Пустое поле',
    2: 'Не более 128 символов',
  };

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

  void clear() {
    nameController.clear();
    urlController.clear();
    descriptionController.clear();
    timeController.clear();
    manualController.clear();
    setState(() {
      ingredientInputs.clear();
    });
  }

  int validateName() {
    if (nameController.text.isEmpty) {
      return 1;
    }
    if (nameController.text.length > 128) {
      return 2;
    }

    return 0;
  }

  int validateUrl() {
    if (urlController.text.length > 512) {
      return 2;
    }

    return 0;
  }

  int validateDescription() {
    if (descriptionController.text.isEmpty) {
      return 1;
    }
    if (descriptionController.text.length > 2048) {
      return 2;
    }

    return 0;
  }

  int validateManual() {
    if (descriptionController.text.isEmpty) {
      return 1;
    }
    if (descriptionController.text.length > 2048) {
      return 2;
    }

    return 0;
  }

  int validateTime() {
    if (timeController.text.isEmpty) {
      return 1;
    }
    if (int.parse(timeController.text) > 10e9) {
      return 2;
    }

    return 0;
  }

  int validateIngredient(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 1;
    }
    if (controller.text.length > 128) {
      return 2;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    var recipesModel = Provider.of<RecipesModel>(context);
    var categoriesModel = Provider.of<CategoriesModel>(context);
    return Consumer<UserModel>(
      builder: (context, user, child) => SafeArea(
        child: GestureDetector(
          onTap: () => unfocus(),
          child: Scaffold(
            appBar: const CustomAppbar(
              title: 'Шеф-поварёнок',
            ),
            body: user.data.isAuthorized
                ? SingleChildScrollView(
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
                            obscureText: false,
                            expands: false,
                            focusNode: focusName,
                            controller: nameController,
                            errorMessage: nameMessages[nameStatus],
                          ),
                          SizedBox(height: 12.h),
                          CustomInput(
                            width: 390.w,
                            title: 'Ссылка на изображение',
                            obscureText: false,
                            expands: false,
                            focusNode: focusUrl,
                            controller: urlController,
                            errorMessage: urlMessages[urlStatus],
                          ),
                          SizedBox(height: 12.h),
                          CustomInput(
                            width: 390.w,
                            title: 'Описание',
                            obscureText: false,
                            expands: true,
                            focusNode: focusDescription,
                            controller: descriptionController,
                            errorMessage:
                                descriptionMessages[descriptionStatus],
                          ),
                          SizedBox(height: 30.h),
                          CustomInput(
                            width: 390.w,
                            title: 'Время приготовления',
                            obscureText: false,
                            expands: false,
                            keyboardType: TextInputType.number,
                            focusNode: focusTime,
                            controller: timeController,
                            errorMessage: timeMessages[timeStatus],
                          ),
                          SizedBox(height: 18.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Ингредиенты',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontSize: 17.h,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              TextButton.icon(
                                onPressed: () => setState(
                                  () {
                                    ingredientInputs.add(
                                      IngredientInput(),
                                    );
                                    noIngredients = false;
                                  },
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
                          if (noIngredients)
                            Text(
                              'В рецепте должен быть хотя бы 1 ингредиент',
                              style:
                                  TextStyle(fontSize: 8.h, color: Colors.red),
                            ),
                          for (var ingredientInput in ingredientInputs)
                            Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomInput(
                                    title: 'Название',
                                    obscureText: false,
                                    focusNode: ingredientInput.focusName,
                                    expands: false,
                                    width: 160.w,
                                    controller: ingredientInput.nameController,
                                    errorMessage: ingredientMessages[
                                        ingredientInput.nameStatus],
                                  ),
                                  SizedBox(width: 10.w),
                                  CustomInput(
                                    title: 'Количество',
                                    obscureText: false,
                                    focusNode: ingredientInput.focusCount,
                                    expands: false,
                                    width: 160.w,
                                    controller: ingredientInput.countController,
                                    errorMessage: ingredientMessages[
                                        ingredientInput.countStatus],
                                  ),
                                  SizedBox(width: 5.w),
                                  TextButton.icon(
                                    onPressed: () => setState(
                                      () => ingredientInputs
                                          .remove(ingredientInput),
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
                            obscureText: false,
                            expands: true,
                            focusNode: focusManual,
                            controller: manualController,
                            errorMessage: manualMessages[manualStatus],
                          ),
                          SizedBox(height: 36.h),
                          CustomButton(
                            innerColor: true,
                            onTap: () async {
                              int status = 0;
                              nameStatus = validateName();
                              status = max(status, nameStatus);
                              urlStatus = validateUrl();
                              status = max(status, urlStatus);
                              descriptionStatus = validateDescription();
                              status = max(status, descriptionStatus);
                              timeStatus = validateTime();
                              status = max(status, timeStatus);
                              manualStatus = validateManual();
                              status = max(status, manualStatus);
                              for (var ingredientInput in ingredientInputs) {
                                ingredientInput.nameStatus = validateIngredient(
                                    ingredientInput.nameController);
                                status =
                                    max(status, ingredientInput.nameStatus);
                                ingredientInput.countStatus =
                                    validateIngredient(
                                        ingredientInput.countController);
                                status =
                                    max(status, ingredientInput.countStatus);
                              }
                              if (ingredientInputs.isEmpty) {
                                noIngredients = true;
                                status = 1;
                              }

                              if (status == 0) {
                                Recipe recipe = Recipe.create();
                                recipe.name = nameController.text;
                                recipe.img = urlController.text;
                                recipe.description = descriptionController.text;
                                recipe.time = int.parse(timeController.text);
                                recipe.manual = manualController.text;
                                List<Ingredient> ingredients = [];
                                for (var ingredientInput in ingredientInputs) {
                                  ingredients.add(Ingredient(
                                      name: ingredientInput.nameController.text,
                                      count: ingredientInput
                                          .countController.text));
                                }
                                recipe.ingredients = ingredients;
                                await user.addRecipe(recipe);
                                recipesModel
                                    .update(categoriesModel.currentCategory);

                                if (context.mounted) {
                                  showCreateNotification(context);
                                }

                                clear();

                                setState(() {});
                              }
                            },
                            title: 'Создать',
                            border: false,
                          ),
                          SizedBox(height: 36.h),
                        ],
                      ),
                    ),
                  )
                : const UnauthorizedPage(),
          ),
        ),
      ),
    );
  }
}
