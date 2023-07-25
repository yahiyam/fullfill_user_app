import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/text_strings.dart';
import 'package:user_app/features/view/auth/widgets/custom_text_field.dart';
import 'package:user_app/features/view_model/auth/login_provider.dart';
import 'package:user_app/features/view_model/auth/text_obscure.dart';
import 'package:user_app/utils/screen_size.dart';
import 'package:user_app/utils/common_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Obscure(),
      child: ListView(
        padding: EdgeInsets.only(top: Screen.height(12.5)),
        children: [
          Consumer<LoginProvider>(
            builder: (context, loginProvider, _) {
              return Form(
                key: loginProvider.loginFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Screen.width(10),
                      ),
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
                          SizedBox(height: Screen.height(10)),
                        ],
                      ),
                    ),
                    CommonButton(
                      title: 'Login',
                      onTap: () {
                        loginProvider.loginFormValidation(context);
                      },
                    ),
                    SizedBox(height: Screen.height(10)),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.person,
                              color: grey,
                              size: 10,
                            ),
                            SizedBox(width: 8),
                            Text(
                              yAppDeveloperName,
                              style: TextStyle(
                                color: grey,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
