import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:provider/provider.dart';


import 'package:fullfill_user_app/view/add_address/functions/get_address.dart';
import 'package:fullfill_user_app/view_model/add_address/address_controller_provider.dart';

Row buildShowCurrentAddress(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        flex: 6,
        child: TextField(
          controller: context.watch<AddressControllerProvider>().fullAddressController,
          decoration: const InputDecoration(
            labelText: "What's your address?",
          ),
        ),
      ),
      const SizedBox(width: 10),
      //get location button
      Expanded(
        child: GestureDetector(
          onTap: () => getUserLocationAddress(context),
          child: SizedBox(
            height: Screen.height(7),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.person_pin_circle,
                  size: 30,
                  color: commonColor,
                ),
                Text(
                  'Get my Location',
                  style: TextStyle(fontSize: 10, height: .9),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
