import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatefulWidget {
  final String? title;
  final String? errorMessage;
  final bool obscureText;
  final FocusNode focusNode;
  final double width;
  final bool expands;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  const CustomInput({
    super.key,
    this.errorMessage,
    required this.obscureText,
    required this.focusNode,
    required this.expands,
    required this.width,
    required this.controller,
    this.keyboardType,
    this.title,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final _myFocusNotifier = ValueNotifier<bool>(false);

  void _onFocusChange() {
    _myFocusNotifier.value = widget.focusNode.hasFocus;
  }

  @override
  initState() {
    super.initState();

    widget.focusNode.addListener(_onFocusChange);
  }

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
          width: widget.width,
          height: widget.expands ? null : 65.h,
          child: ValueListenableBuilder(
              valueListenable: _myFocusNotifier,
              builder: (_, isFocused, child) {
                return TextFormField(
                  focusNode: widget.focusNode,
                  controller: widget.controller,
                  obscureText: widget.obscureText,
                  style: TextStyle(fontSize: 14.r),
                  maxLines: widget.expands ? null : 1,
                  keyboardType: widget.keyboardType,
                  inputFormatters: widget.keyboardType == TextInputType.number
                      ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
                      : [],
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 10.h),
                    filled: true,
                    fillColor: isFocused
                        ? Theme.of(context).colorScheme.secondaryFixed
                        : Theme.of(context).colorScheme.secondary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      borderSide: BorderSide.none,
                    ),
                    errorText: widget.errorMessage,
                    errorStyle: TextStyle(
                      fontSize: 8.h,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
