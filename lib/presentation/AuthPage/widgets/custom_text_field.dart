import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.enabled = true,
    this.controller,
    this.obscureText,
    this.labelText,
    this.icon,
    this.keyboardType,
  });
  final bool? enabled;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? labelText;
  final IconData? icon;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          icon,
          color: const Color(0xfffa4a0c),
        ),
      ),
    );
  }
}
