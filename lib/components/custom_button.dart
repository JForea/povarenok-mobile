import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final bool border;
  Color? innerColor;
  final String title;
  final Function() onTap;

  CustomButton(
      {super.key,
      this.innerColor,
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
                      color: innerColor ?? Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(15.r)))
                  : BoxDecoration(
                      color: innerColor ?? Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.r,
                    color: innerColor == null ? Colors.black : Colors.white,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
