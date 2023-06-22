import 'package:flutter/material.dart';
import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/screen_size.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.title,
    this.isWhite = false,
    this.onTap,
  });

  final String? title;
  final bool isWhite;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Screen.width(10)),
      width: double.infinity,
      height: Screen.height(8),
      child: Material(
        color: isWhite ? commonColor.withAlpha(30) : commonColor,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: onTap,
          splashColor: black12,
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 17,
                color: isWhite ? commonColor : white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}