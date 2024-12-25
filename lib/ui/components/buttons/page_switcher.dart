import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageSwitcher extends StatelessWidget {
  final Function() onTap;
  final int index;
  final bool isActive;

  const PageSwitcher(
      {super.key,
      required this.onTap,
      required this.index,
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
                border:
                    Border.all(color: Theme.of(context).colorScheme.onSurface),
                borderRadius: BorderRadius.circular(1000),
              ),
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
                color: isActive
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
