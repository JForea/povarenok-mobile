import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/ui/pages/home_page.dart';

import 'package:povarenok_mobile/ui/style/app_theme.dart';
import 'package:povarenok_mobile/ui/pages/authorization/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Шеф-поварёнок',
        initialRoute: '/auth',
        routes: {
          '/auth': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
