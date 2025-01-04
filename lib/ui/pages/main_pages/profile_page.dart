import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';
import 'package:povarenok_mobile/ui/components/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:povarenok_mobile/ui/components/buttons/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        final ts = TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 16.h,
          fontWeight: FontWeight.w500,
        );
        if (user.data.isAuthorized && !user.data.infoUpdated) {
          user.updateProfileInfo();
        }
        return SafeArea(
          child: Scaffold(
            appBar: const CustomAppbar(title: 'Шеф-поварёнок'),
            body: user.data.isAuthorized
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 18.w, top: 18.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Имя пользователя:', style: ts),
                            SizedBox(height: 12.h),
                            Text(user.data.username, style: ts),
                            SizedBox(height: 24.h),
                            Text('Всего рецептов создано:', style: ts),
                            SizedBox(height: 12.h),
                            Text('${user.data.recipes.length}', style: ts),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
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
                              Navigator.of(context).pushNamed('/auth/login'),
                          innerColor: true,
                          title: 'Авторизоваться',
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
