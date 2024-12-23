import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:povarenok_mobile/models/categories_model.dart';

class CategoriesMenuItem extends StatelessWidget {
  final int categoryID;

  const CategoriesMenuItem({super.key, required this.categoryID});

  @override
  Widget build(BuildContext context) {
    var categoriesModel = Provider.of<CategoriesModel>(context);
    return GestureDetector(
      onTap: () => {
        categoriesModel.switchCategory(categoryID),
        Navigator.of(context).pop(),
      },
      child: SizedBox(
        width: 200.w,
        height: 60.h,
        child: Center(
          child: Text(categoriesModel.data[categoryID].title),
        ),
      ),
    );
  }
}
