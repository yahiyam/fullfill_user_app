import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/utils/screen_size.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({super.key, this.title});
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: transparent,
      leading: IconButton(
        padding: EdgeInsets.only(left: Screen.width(4)),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: Screen.height(2.2),
        ),
      ),
      title: Text(
        title ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: black,
        ),
      ),
    );
  }
}
