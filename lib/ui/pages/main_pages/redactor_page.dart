import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:povarenok_mobile/ui/components/inputs/custom_input.dart';

class RedactorPage extends StatefulWidget {
  const RedactorPage({super.key});

  @override
  State<RedactorPage> createState() => _RedactorPageState();
}

class _RedactorPageState extends State<RedactorPage> {
  String name = '';
  String url = '';
  String description = '';
  int? time;
  String manual = '';

  FocusNode focusName = FocusNode();
  FocusNode focusUrl = FocusNode();
  FocusNode focusDescription = FocusNode();
  FocusNode focusTime = FocusNode();
  FocusNode focusManual = FocusNode();

  void unfocus() {
    focusName.unfocus();
    focusUrl.unfocus();
    focusDescription.unfocus();
    focusTime.unfocus();
    focusManual.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => unfocus(),
        child: Scaffold(
          appBar: const CustomAppbar(
            title: 'Шеф-поварёнок',
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    'Создание рецепта',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Название',
                    onChange: (s) => name = s,
                    obscureText: false,
                    expands: false,
                    focusNode: focusName,
                  ),
                  SizedBox(height: 12.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Ссылка на изображение',
                    onChange: (s) => url = s,
                    obscureText: false,
                    expands: false,
                    focusNode: focusUrl,
                  ),
                  SizedBox(height: 12.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Описание',
                    onChange: (s) => description = s,
                    obscureText: false,
                    expands: true,
                    focusNode: focusDescription,
                  ),
                  SizedBox(height: 12.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Время приготовления',
                    onChange: (s) {
                      if (s.isNotEmpty) {
                        time = int.parse(s);
                      } else {
                        time = null;
                      }
                    },
                    obscureText: false,
                    expands: false,
                    keyboardType: TextInputType.number,
                    focusNode: focusTime,
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ингредиенты',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 17.h,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      TextButton.icon(
                        onPressed: () {},
                        label: Icon(
                          CupertinoIcons.add,
                          size: 28.r,
                        ),
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          fixedSize: Size.fromRadius(28.r),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  CustomInput(
                    width: 390.w,
                    title: 'Способ приготовления',
                    onChange: (s) => manual = s,
                    obscureText: false,
                    expands: true,
                    focusNode: focusManual,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
