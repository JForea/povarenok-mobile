import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:povarenok_mobile/ui/components/inputs/custom_input.dart';
import 'package:povarenok_mobile/ui/components/buttons/custom_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email = '';
  String login = '';
  String password = '';
  String passwordConfirmation = '';

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
                'Регистрация',
                style: TextStyle(
                  fontSize: 28.r,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              CustomInput(
                title: 'Почта',
                obscureText: false,
                onChange: (val) => setState(
                  () {
                    email = val;
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomInput(
                title: 'Логин',
                obscureText: false,
                onChange: (val) => setState(
                  () {
                    login = val;
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomInput(
                title: 'Пароль',
                obscureText: true,
                onChange: (val) => setState(
                  () {
                    password = val;
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomInput(
                title: 'Подтвердите пароль',
                obscureText: true,
                onChange: (val) => setState(
                  () {
                    passwordConfirmation = val;
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                onTap: () => {print('tap')},
                title: 'Зарегистрироваться',
                border: false,
                innerColor: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onTap: () => {Navigator.of(context).pop()},
                title: 'Вернуться ко входу',
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
