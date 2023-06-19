import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/presentation/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/presentation/cart_page/providers/cart_item_counter_provider.dart';
import 'package:provider/provider.dart';

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
          Provider.of<CartItemCounter>(context, listen: false)
              .displayCartListItemsNumber();
        },
        icon: const Icon(Icons.clear_all),
      )
    ],
  );
}
