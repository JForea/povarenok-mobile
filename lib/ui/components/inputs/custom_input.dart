import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatefulWidget {
  final String? title;
  final Function(String) onChange;
  final bool obscureText;

  const CustomInput(
      {super.key,
      this.title,
      required this.onChange,
      required this.obscureText});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              widget.title!,
              style: TextStyle(fontSize: 16.r),
            ),
          ),
        if (widget.title != null)
          SizedBox(
            height: 8.h,
          ),
        SizedBox(
          width: 260.w,
          child: TextField(
            obscureText: widget.obscureText,
            style: TextStyle(fontSize: 14.r),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14, vertical: 10.h),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: widget.onChange,
          ),
        ),
      ],
    );
  }
}
