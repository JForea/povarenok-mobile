import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/ui/components/buttons/page_switcher.dart';

class PageSlider extends StatelessWidget {
  final int activeIndex;
  final int length;
  final Function({int? id, bool? inc}) pageSwitch;

  const PageSlider(
      {super.key,
      required this.pageSwitch,
      required this.activeIndex,
      required this.length});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 6),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: PageSwitcher(
                onTap: () => pageSwitch(inc: false),
                isActive: false,
                child: Icon(
                  CupertinoIcons.arrow_left,
                  size: 28.r,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: PageSwitcher(
                onTap: () => pageSwitch(id: 0),
                isActive: activeIndex == 0,
                child: Icon(
                  activeIndex == 0
                      ? CupertinoIcons.book_fill
                      : CupertinoIcons.book,
                  size: 28.r,
                  color: activeIndex == 0
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            for (int i = 1; i <= length; i++)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: PageSwitcher(
                  onTap: () => pageSwitch(id: i),
                  isActive: activeIndex == i,
                  child: Text(
                    '$i',
                    style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: activeIndex == i
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
            PageSwitcher(
              onTap: () => pageSwitch(inc: true),
              isActive: false,
              child: Icon(
                CupertinoIcons.arrow_right,
                size: 28.r,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
