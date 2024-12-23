import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {},
      icon: Icon(
        CupertinoIcons.search,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 32.r,
      ),
    );
  }
}
