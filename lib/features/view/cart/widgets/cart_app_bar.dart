import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/features/view/cart/functions/assistant_methods.dart';
import 'package:user_app/utils/screen_size.dart';

class CartAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
