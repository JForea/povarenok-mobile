import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  final int id;

  const LikeButton(this.id, {super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        return GestureDetector(
          onTap: () => user.addToFavourite(widget.id),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                user.data.favourites.contains(widget.id)
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                size: 24.r,
                color: user.data.favourites.contains(widget.id)
                    ? const Color(0xFFFF7259)
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ],
          ),
        );
      },
    );
  }
}
