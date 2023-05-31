import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/common_widgets/common_widgets.dart';
import 'package:fullfill_user_app/presentation/AuthPage/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.width / 10),
              child: Column(
                children: [
                  const CustomTextField(
                    labelText: 'Email address',
                    icon: Icons.alternate_email,
                  ),
                  SizedBox(height: screen.height / 70),
                  const CustomTextField(
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
                Navigator.pushReplacementNamed(context, '/home');
              },
            )
          ],
        ),
      ),
    );
  }
}
