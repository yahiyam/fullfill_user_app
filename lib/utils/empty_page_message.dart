import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/utils/screen_size.dart';

class EmptyPageMessage extends StatelessWidget {
  const EmptyPageMessage({
    super.key,
    this.icon,
    required this.mainTitle,
    required this.subTitle,
  });
  final IconData? icon;
  final String mainTitle;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon != null
            ? Icon(
                icon,
                size: Screen.height(20),
                color: black12,
              )
            : SizedBox(height: Screen.height(11)),
        Text(
          mainTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 2.5,
            color: black,
          ),
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            height: 1.2025,
            color: grey,
          ),
        ),
      ],
    );
  }
}
