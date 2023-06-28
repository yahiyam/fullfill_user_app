import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/common_button.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({super.key, required this.onTap});
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return CommonButton(
      title: 'Place Order',
      onTap: onTap,
    );
  }
}
