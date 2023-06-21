import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/presentation/save_address/save_address.dart';
import 'package:fullfill_user_app/utils/common_button.dart';

Column buildBottomButtons(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: Screen.height(1)),
      CommonButton(
        isWhite: true,
        title: 'Add New Address',
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SaveAddressPage(),
          ));
        },
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
