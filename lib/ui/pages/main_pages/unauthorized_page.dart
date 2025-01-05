import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:povarenok_mobile/ui/components/buttons/custom_button.dart';

class UnauthorizedPage extends StatelessWidget {
  const UnauthorizedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          SvgPicture.asset(
            'assets/icons/sad.svg',
            height: 240.h,
          ),
          SizedBox(height: 60.h),
          Text(
            'Для получения доступа ко всем возможностям сервиса необходимо авторизоваться.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 18.h,
              fontWeight: FontWeight.w500,
              height: 2.h,
            ),
          ),
          SizedBox(height: 120.h),
          CustomButton(
            border: false,
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/auth/login'),
            innerColor: true,
            title: 'Авторизоваться',
          ),
        ],
      ),
    );
  }
}
