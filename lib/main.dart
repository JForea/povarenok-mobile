import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/ui/app.dart';
import 'package:povarenok_mobile/models/categories_model.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(ChangeNotifierProvider(
      create: (context) => CategoriesModel(), child: const App()));
}
