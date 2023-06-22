import 'package:flutter/material.dart';
import 'package:fullfill_user_app/view/payment_page/payment_page.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/global/screen_size.dart';

import 'package:fullfill_user_app/view/save_address/provider/address_controller_provider.dart';
import 'package:fullfill_user_app/view/save_address/save_address.dart';

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
            builder: (context) => ChangeNotifierProvider(
                create: (context) => AddressControllerProvider(),
                child: const SaveAddressPage()),
          ));
        },
      ),
      SizedBox(height: Screen.height(1)),
      CommonButton(
        title: 'Proceed to payment',
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PaymentPage(),
          ));
        },
      ),
      SizedBox(height: Screen.height(3)),
    ],
  );
}
