import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({
    super.key,
    this.label,
    this.keyboardType,
    this.inputFormatters,
    required this.controller,
  });

  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
      ),
      inputFormatters: inputFormatters,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your ${label?.toLowerCase()}';
        }
        return null;
      },
    );
  }
}
