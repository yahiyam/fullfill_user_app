import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/common_widgets/common_widgets.dart';
import 'package:fullfill_user_app/presentation/AuthPage/widgets/custom_text_field.dart';
import 'package:fullfill_user_app/provider/auth_provider.dart';
import 'package:fullfill_user_app/provider/image_provider.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer<RegisterationProvideref>(
        builder: (context, registerationProvider, _) {
          return Column(
            children: [
              SizedBox(height: screen.height / 70),
              Consumer<ImagesProvider>(
                builder: (context, imagesProvider, _) => InkWell(
                  onTap: () => imagesProvider.pickImage(),
                  child: CircleAvatar(
                    radius: screen.width * 0.20,
                    backgroundColor: Colors.white,
                    backgroundImage: imagesProvider.imageXFile == null
                        ? null
                        : FileImage(File(imagesProvider.imageXFile!.path)),
                    child: imagesProvider.imageXFile == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: screen.width * 0.20,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: screen.height / 70),
              Form(
                key: registerationProvider.registrationFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screen.width / 10),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: registerationProvider.nameController,
                        icon: Icons.person,
                        labelText: 'Name',
                      ),
                      SizedBox(height: screen.height / 70),
                      CustomTextField(
                        controller: registerationProvider.emailController,
                        icon: Icons.alternate_email,
                        labelText: 'Email',
                      ),
                      SizedBox(height: screen.height / 70),
                      CustomTextField(
                        controller: registerationProvider.passwordController,
                        icon: Icons.password,
                        labelText: 'Password',
                        obscureText: true,
                      ),
                      SizedBox(height: screen.height / 70),
                      CustomTextField(
                        controller:
                            registerationProvider.confirmPasswordController,
                        icon: Icons.password,
                        labelText: 'Confirm Password',
                        obscureText: true,
                      ),
                      SizedBox(height: screen.height / 70),
                      CustomTextField(
                        controller: registerationProvider.phoneController,
                        icon: Icons.phone,
                        labelText: 'Phone',
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: screen.height / 70),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  color: Color(0xfffa4a0c),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screen.height / 70),
              CommonButton(
                title: "Sign Up",
                onTap: () {
                  registerationProvider.registrationFormValidation(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
