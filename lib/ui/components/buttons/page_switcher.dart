import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageSwitcher extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final bool isActive;

  const PageSwitcher(
      {super.key,
      required this.onTap,
      required this.child,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Container(
        width: 55.r,
        height: 55.r,
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Theme.of(context).primaryColor,
              )
            : BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 1.3.r),
                borderRadius: BorderRadius.circular(1000),
              ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
