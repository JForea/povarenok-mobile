import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/http/models/user_model.dart';

import 'package:povarenok_mobile/ui/components/inputs/custom_input.dart';
import 'package:povarenok_mobile/ui/components/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  int emailStatus = 0;
  int usernameStatus = 0;
  int passwordStatus = 0;
  int passwordConfirmationStatus = 0;

  Map<int, String?> emailMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Email не может быть короче 5 символов',
    3: 'Email не может быть длиннее 32 символов',
    4: 'Введён некорректный email',
  };

  Map<int, String?> usernameMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Логин не может быть короче 5 символов',
    3: 'Логин не может быть длиннее 32 символов',
    4: 'Такой пользователь уже зарегистрирован',
  };

  Map<int, String?> passwordMessages = {
    0: null,
    1: 'Поле не может быть пустым',
    2: 'Пароль не может быть короче 5 символов',
    3: 'Пароль не может быть длиннее 32 символов',
    4: 'Пароли не совпадают',
  };

  final FocusNode focusEmail = FocusNode();
  final FocusNode focusUsername = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusPasswordConfirmation = FocusNode();

  int validateEmail() {
    if (emailController.text.isEmpty) {
      return 1;
    }
    if (emailController.text.length < 5) {
      return 2;
    }
    if (emailController.text.length > 32) {
      return 3;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      return 4;
    }

    return 0;
  }

  int validateUsername() {
    if (usernameController.text.isEmpty) {
      return 1;
    }
    if (usernameController.text.length < 5) {
      return 2;
    }
    if (usernameController.text.length > 32) {
      return 3;
    }

    return 0;
  }

  int validatePassword() {
    if (passwordController.text.isEmpty) {
      return 1;
    }
    if (passwordController.text.length < 5) {
      return 2;
    }
    if (passwordController.text.length > 32) {
      return 3;
    }
    if (passwordController.text != passwordConfirmationController.text) {
      return 4;
    }

    return 0;
  }

  void unfocus() {
    focusUsername.unfocus();
    focusPassword.unfocus();
    focusPasswordConfirmation.unfocus();
    focusEmail.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, f) {
        Navigator.of(context).pushReplacementNamed('/auth/login');
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
                    height: 20.h,
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
                    width: 280.w,
                    title: 'Почта',
                    obscureText: false,
                    expands: false,
                    focusNode: focusEmail,
                    controller: emailController,
                    errorMessage: emailMessages[emailStatus],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomInput(
                    width: 280.w,
                    title: 'Логин',
                    obscureText: false,
                    expands: false,
                    focusNode: focusUsername,
                    controller: usernameController,
                    errorMessage: usernameMessages[usernameStatus],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomInput(
                    width: 280.w,
                    title: 'Пароль',
                    obscureText: true,
                    expands: false,
                    focusNode: focusPassword,
                    controller: passwordController,
                    errorMessage: passwordMessages[passwordStatus],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomInput(
                    width: 280.w,
                    title: 'Подтвердите пароль',
                    obscureText: true,
                    expands: false,
                    focusNode: focusPasswordConfirmation,
                    controller: passwordConfirmationController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    onTap: () async {
                      setState(() {
                        usernameStatus = validateUsername();
                        passwordStatus = validatePassword();
                        emailStatus = validateEmail();

                        if (passwordStatus == 4) {
                          passwordConfirmationController.clear();
                        }
                      });

                      if (usernameStatus == 0 &&
                          passwordStatus == 0 &&
                          emailStatus == 0) {
                        bool loggedIn = await userModel.register(
                          username: usernameController.text,
                          password: passwordController.text,
                          email: emailController.text,
                        );
                        if (loggedIn && context.mounted) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else if (!loggedIn) {
                          setState(() {
                            usernameStatus = 4;
                            passwordStatus = 0;
                            emailStatus = 0;
                          });
                        }
                      }
                    },
                    title: 'Зарегистрироваться',
                    border: false,
                    innerColor: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    onTap: () {
                      unfocus();
                      Navigator.of(context).pushReplacementNamed('/auth/login');
                    },
                    title: 'Вернуться ко входу',
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
