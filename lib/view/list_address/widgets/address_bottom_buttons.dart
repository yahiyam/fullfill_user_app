import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:fullfill_user_app/view_model/list_address/address_select_provider.dart';
import 'package:fullfill_user_app/view/payment_page/payment_page.dart';
import 'package:provider/provider.dart';


import 'package:fullfill_user_app/view_model/add_address/address_controller_provider.dart';
import 'package:fullfill_user_app/view/add_address/save_address.dart';

import 'package:fullfill_user_app/utils/common_button.dart';

Column buildBottomButtons(BuildContext context, sellerUID) {
  final bool isAddressesEmpty =
      context.read<AddressSelectionProvider>().addresses.isEmpty;
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
      Visibility(
        visible: !isAddressesEmpty,
        child: CommonButton(
          title: 'Proceed to payment',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PaymentPage(sellerUID: sellerUID),
            ));
          },
        ),
      ),
      SizedBox(height: Screen.height(3)),
    ],
  );
}
