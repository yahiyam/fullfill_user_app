import 'package:flutter/material.dart';
import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/screen_size.dart';
import 'package:fullfill_user_app/view/cart_page/functions/assistant_methods.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: Screen.height(10),
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
    title: const Text(
      'Cart',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: black,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          clearCartNow(context);
        },
        icon: const Icon(Icons.clear_all),
      )
    ],
  );
}
