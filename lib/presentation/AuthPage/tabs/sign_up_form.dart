import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/common_widgets/common_widgets.dart';
import 'package:fullfill_user_app/presentation/AuthPage/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile = imageXFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screen.height / 70),
          InkWell(
            onTap: _getImage,
            child: CircleAvatar(
              radius: screen.width * 0.20,
              backgroundColor: Colors.white,
              backgroundImage: imageXFile == null
                  ? null
                  : FileImage(
                      File(imageXFile!.path),
                    ),
              child: imageXFile == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      size: screen.width * 0.20,
                      color: Colors.grey,
                    )
                  : null,
            ),
          ),
          SizedBox(height: screen.height / 70),
          Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screen.width / 10),
              child: Column(
                children: [
                  const CustomTextField(
                    icon: Icons.person,
                    labelText: 'Name',
                  ),
                  SizedBox(height: screen.height / 70),
                  const CustomTextField(
                    icon: Icons.alternate_email,
                    labelText: 'Email',
                  ),
                  SizedBox(height: screen.height / 70),
                  const CustomTextField(
                    icon: Icons.password,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: screen.height / 70),
                  const CustomTextField(
                    icon: Icons.password,
                    labelText: 'Confirm Password',
                    obscureText: true,
                  ),
                  SizedBox(height: screen.height / 70),
                  const CustomTextField(
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
            onTap: () {},
          )
        ],
      ),
    );
  }
}
