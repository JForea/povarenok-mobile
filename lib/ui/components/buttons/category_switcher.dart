import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/ui/components/menus/categories_menu.dart';
import 'package:povarenok_mobile/models/categories_model.dart';

class CategorySwitcher extends StatelessWidget {
  const CategorySwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    var categoriesModel = Provider.of<CategoriesModel>(context);
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) => const CategoriesMenu(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            categoriesModel.data[categoriesModel.currentCategory].title,
            style: TextStyle(
              fontSize: 20.r,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
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
    );
  }
}
