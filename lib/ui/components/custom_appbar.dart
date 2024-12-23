import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      toolbarHeight: 70.h,
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20.r,
            fontWeight: FontWeight.w700),
      ),
      actions: actions != null
          ? List.generate(
              actions!.length,
              (i) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: actions![i],
              ),
            )
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
