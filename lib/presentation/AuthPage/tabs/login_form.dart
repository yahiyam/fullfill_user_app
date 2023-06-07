import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/common_widgets/common_widgets.dart';
import 'package:fullfill_user_app/presentation/AuthPage/widgets/custom_text_field.dart';
import 'package:fullfill_user_app/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer<LoginProvider>(builder: (context, loginProvider, _) {
        return Form(
          key: loginProvider.loginFormKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screen.width / 10),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: loginProvider.emailController,
                      labelText: 'Email address',
                      icon: Icons.alternate_email,
                    ),
                    SizedBox(height: screen.height / 70),
                    CustomTextField(
                      controller: loginProvider.passwordController,
                      obscureText: true,
                      labelText: 'Password',
                      icon: Icons.password_rounded,
                    ),
                    SizedBox(height: screen.height / 70),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Passcode?',
                          style: TextStyle(
                            color: Color(0xfffa4a0c),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screen.height / 70),
                  ],
                ),
              ),
              CommonButton(
                title: 'Login',
                onTap: () {
                  loginProvider.loginFormValidation(context);
                },
              )
            ],
          ),
        );
      }),
    );
  }
}