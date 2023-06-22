import 'package:flutter/material.dart';
import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/screen_size.dart';
import 'package:fullfill_user_app/view/auth_page/providers/login_provider.dart';
import 'package:fullfill_user_app/view/auth_page/widgets/custom_text_field.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: Screen.height(12.5)),
      child: Consumer<LoginProvider>(builder: (context, loginProvider, _) {
        return Form(
          key: loginProvider.loginFormKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Screen.width(10)),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: loginProvider.emailController,
                      labelText: 'Email address',
                      icon: Icons.alternate_email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: Screen.height(1.42)),
                    CustomTextField(
                      controller: loginProvider.passwordController,
                      obscureText: true,
                      labelText: 'Password',
                      icon: Icons.password_rounded,
                      showSuffixIcon: true,
                    ),
                    SizedBox(height: Screen.height(1.42)),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Passcode?',
                          style: TextStyle(
                            color: commonColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Screen.height(1.42)),
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
