import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCreateNotification(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withAlpha(128),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 200.h,
          width: 370.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Center(
              child: Text(
                'Рецепт успешно создан!',
                style: TextStyle(
                  height: 1.8.h,
                  color: Colors.black,
                  fontFamily: 'Comfortaa',
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
