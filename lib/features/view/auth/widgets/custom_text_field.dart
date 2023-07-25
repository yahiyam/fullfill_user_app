import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/features/view_model/auth/text_obscure.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final bool? obscureText;
  final String? labelText;
  final IconData? icon;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? showSuffixIcon;
  const CustomTextField({
    super.key,
    this.labelText,
    this.icon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.showSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Obscure>(builder: (context, obscure, _) {
      return TextFormField(
        obscureText: obscureText! && !obscure.passwordVisible,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: (value) => obscure.toggleTyped(value),
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            color: commonColor,
          ),
          suffixIcon: obscureText! && showSuffixIcon! && obscure.isTyped
              ? IconButton(
                  icon: Icon(
                    obscure.passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    obscure.togglePasswordVisibility();
                    Future.delayed(const Duration(seconds: 2), () {
                      obscure.togglePasswordVisibility();
                    });
                  },
                )
              : null,
        ),
      );
    });
  }
}
