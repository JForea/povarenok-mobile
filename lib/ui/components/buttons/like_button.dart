import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikeButton extends StatelessWidget {
  final int number;

  const LikeButton({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('like'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.heart,
            size: 20.r,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, top: 3.5.h),
            child: Text(
              '$number',
              style: TextStyle(fontSize: 13.h, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
