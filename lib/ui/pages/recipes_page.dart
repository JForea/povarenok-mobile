import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/models/categories_model.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesModel>(builder: (context, categories, childe) {
      if (categories.data.isEmpty) {
        categories.update();
      }
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
            toolbarHeight: 70.h,
            title: Text(
              'Рецепты',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 20.r,
                  fontWeight: FontWeight.w700),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    CupertinoIcons.search,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 32.r,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, left: 15.w),
                child: GestureDetector(
                  // onTap: () => showPopover(context: context, bodyBuilder: (context) => {

                  // }),
                  child: Row(
                    children: [
                      Text(
                        'Все рецепты',
                        // widget.filterOptions[widget.currentFilterOption],
                        style: TextStyle(
                          fontSize: 20.r,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationX(math.pi),
                          child: Icon(
                            CupertinoIcons.triangle_fill,
                            size: 10.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
