import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/utils/common_button.dart';

Column buildBottomButtons() {
  return Column(
    children: [
      SizedBox(height: Screen.height(1)),
      CommonButton(
        isWhite: true,
        title: 'Add New Address',
        onTap: () {},
      ),
      SizedBox(height: Screen.height(1)),
      CommonButton(
        title: 'Proceed to payment',
        onTap: () {},
      ),
      SizedBox(height: Screen.height(3)),
    ],
  );
}
