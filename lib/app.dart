import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:povarenok_mobile/style/app_theme.dart';
import 'package:povarenok_mobile/pages/authorization/auth_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      builder: (context, child) => MaterialApp(
        title: 'Шеф-поварёнок',
        theme: appTheme,
        home: AuthorizationPage(),
      ),
    );
  }
}
