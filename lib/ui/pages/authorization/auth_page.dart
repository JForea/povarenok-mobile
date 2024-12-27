import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:povarenok_mobile/ui/components/inputs/custom_input.dart';
import 'package:povarenok_mobile/ui/components/buttons/custom_button.dart';
import 'package:povarenok_mobile/ui/pages/authorization/registration_page.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  String login = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/logo.svg',
                height: 160.r,
              ),
              SizedBox(
                height: 20.r,
              ),
              Text(
                'Вход в аккаунт',
                style: TextStyle(
                  fontSize: 28.r,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 110.h),
              CustomInput(
                title: 'Логин',
                obscureText: false,
                onChange: (val) => setState(() {
                  login = val;
                }),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomInput(
                title: 'Пароль',
                obscureText: true,
                onChange: (val) => setState(() {
                  password = val;
                }),
              ),
              SizedBox(
                height: 110.h,
              ),
              CustomButton(
                onTap: () =>
                    {Navigator.of(context).pushReplacementNamed('/home')},
                title: 'Войти',
                border: false,
                innerColor: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegistrationPage()))
                },
                title: 'Регистрация',
                border: true,
                innerColor: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
