import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/features/view/auth/widgets/custom_text_field.dart';
import 'package:user_app/features/view_model/auth/auth_page_tabs_provider.dart';
import 'package:user_app/features/view_model/auth/image_provider.dart';
import 'package:user_app/features/view_model/auth/registeration_provider.dart';
import 'package:user_app/features/view_model/auth/text_obscure.dart';
import 'package:user_app/utils/common_button.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    final tabProvider = Provider.of<AuthTabsProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => Obscure(),
      child: SingleChildScrollView(
        child: Consumer<RegisterationProvider>(
          builder: (context, registerationProvider, _) {
            return Column(
              children: [
                SizedBox(height: screen.height / 70),
                Consumer<ImagesProvider>(
                  builder: (context, imageProvider, _) => InkWell(
                    onTap: () => imageProvider.pickImage(),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: screen.width * 0.20,
                          backgroundColor: white,
                          backgroundImage: imageProvider.imageXFile == null
                              ? null
                              : FileImage(File(imageProvider.imageXFile!.path)),
                          child: imageProvider.imageXFile == null
                              ? Icon(
                                  Icons.add_photo_alternate,
                                  size: screen.width * 0.20,
                                  color: grey,
                                )
                              : null,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                imageProvider.pickImage();
                              },
                              child: const Text('Select Image'),
                            ),
                            TextButton(
                              onPressed: () {
                                imageProvider.clearImage();
                              },
                              child: const Text('Clear Image'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screen.height / 70),
                Form(
                  key: registerationProvider.registrationFormKey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screen.width / 10),
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
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: screen.height / 70),
                        CustomTextField(
                          controller: registerationProvider.passwordController,
                          icon: Icons.password,
                          labelText: 'Password',
                          obscureText: true,
                          showSuffixIcon: true,
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
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              const Text('Already have an account?'),
                              TextButton(
                                onPressed: () {
                                  tabProvider.changeTab(0);
                                },
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: commonColor,
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
      ),
    );
  }
}
