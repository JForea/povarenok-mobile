import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';

import 'package:povarenok_mobile/ui/components/inputs/custom_input.dart';
import 'package:povarenok_mobile/ui/components/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late FocusNode focusUsername = FocusNode();
  late FocusNode focusPassword = FocusNode();

  int usernameStatus = 0;
  int passwordStatus = 0;

  Map<int, String?> usernameMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Логин не может быть короче 5 символов',
    3: 'Логин не может быть длиннее 32 символов',
    4: 'Неверный логин или пароль'
  };

  Map<int, String?> passwordMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Пароль не может быть короче 5 символов',
    3: 'Пароль не может быть длиннее 32 символов',
  };

  void unfocus() {
    focusUsername.unfocus();
    focusPassword.unfocus();
  }

  int validate(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 1;
    }
    if (controller.text.length < 5) {
      return 2;
    }
    if (controller.text.length > 32) {
      return 3;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, f) {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () => unfocus(),
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
                    width: 280.w,
                    title: 'Логин',
                    obscureText: false,
                    expands: false,
                    errorMessage: usernameMessages[usernameStatus],
                    focusNode: focusUsername,
                    controller: usernameController,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomInput(
                    width: 280.w,
                    title: 'Пароль',
                    obscureText: true,
                    expands: false,
                    errorMessage: passwordMessages[passwordStatus],
                    focusNode: focusPassword,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 110.h,
                  ),
                  CustomButton(
                    onTap: () async {
                      setState(() {
                        usernameStatus = validate(passwordController);
                        passwordStatus = validate(passwordController);
                      });
                      if (passwordStatus == 0 && passwordStatus == 0) {
                        bool loggedIn = await userModel.login(
                            username: usernameController.text,
                            password: passwordController.text);
                        if (loggedIn && context.mounted) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          setState(() {
                            usernameStatus = 4;
                            passwordStatus = 0;
                            passwordController.clear();
                          });
                        }
                      }
                    },
                    title: 'Войти',
                    border: false,
                    innerColor: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    onTap: () {
                      unfocus();
                      Navigator.of(context)
                          .pushReplacementNamed('/auth/register');
                    },
                    title: 'Регистрация',
                    border: true,
                    innerColor: false,
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
