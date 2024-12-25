import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final bool border;
  final bool innerColor;
  final String title;
  final Function() onTap;

  const CustomButton(
      {super.key,
      required this.innerColor,
      required this.onTap,
      required this.title,
      required this.border});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          splashColor: const Color(0x01FFFFFF),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Ink(
              height: 65.h,
              width: 290.w,
              decoration: border
                  ? BoxDecoration(
                      color: innerColor
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(15.r)))
                  : BoxDecoration(
                      color: innerColor
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.r,
                    color: innerColor
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
