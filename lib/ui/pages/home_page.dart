import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:povarenok_mobile/ui/pages/main_pages/profile_page.dart';

import 'package:povarenok_mobile/ui/pages/main_pages/recipes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const RecipesPage(),
    const Placeholder(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            child: GNav(
              gap: 16,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              tabBackgroundColor: Theme.of(context).colorScheme.surface,
              padding: EdgeInsets.all(16.h),
              tabs: [
                GButton(
                  icon: CupertinoIcons.book,
                  text: 'Рецепты',
                  onPressed: () => setState(
                    () => currentIndex = 0,
                  ),
                ),
                GButton(
                  icon: CupertinoIcons.heart,
                  text: 'Любимые',
                  onPressed: () => setState(
                    () => currentIndex = 1,
                  ),
                ),
                GButton(
                  icon: CupertinoIcons.person,
                  text: 'Профиль',
                  onPressed: () => setState(
                    () => currentIndex = 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
