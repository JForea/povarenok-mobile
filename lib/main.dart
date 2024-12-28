import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/ui/app.dart';
import 'package:povarenok_mobile/http/models/categories_model.dart';
import 'package:povarenok_mobile/http/models/recipes_model.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CategoriesModel>(create: (_) => CategoriesModel()),
    ChangeNotifierProvider<RecipesModel>(create: (_) => RecipesModel()),
    ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
  ], child: const App()));
}
