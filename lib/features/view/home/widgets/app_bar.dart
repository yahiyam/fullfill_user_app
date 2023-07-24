import 'package:flutter/material.dart';
import 'package:user_app/constants/image_strings.dart';
import 'package:user_app/utils/toast_message.dart';

import '../../../../utils/screen_size.dart';
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          SizedBox(
            width: Screen.width(40),
          ),
          IconButton(
            onPressed: () {
              ToastMessage.show(
                context,
                "Congratulations,\nOrder has been placed successfully.\nContinue Shopping.",
                ySuccesGif,
              );
            },
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
    );
  }
}
