import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/data/models/address.dart';

import 'package:fullfill_user_app/globals/instence.dart';

import 'package:fullfill_user_app/presentation/save_address/provider/address_controller_provider.dart';

import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:fullfill_user_app/utils/widgets/full_screen_loading.dart';

Consumer<AddressControllerProvider> buildSaveButton() {
  return Consumer<AddressControllerProvider>(
    builder: (context, addressController, _) {
      return CommonButton(
        title: 'Save Address',
        onTap: () {
          if (addressController.addressFormkey.currentState!.validate()) {
            FullScreenLoading.show(context);
            final address = Address(
              name: addressController.nameController.text.trim(),
              phoneNumber: addressController.phoneNumberController.text.trim(),
              addressLine: addressController.addressLineController.text.trim(),
              city: addressController.cityController.text.trim(),
              state: addressController.stateController.text.trim(),
              country: addressController.countryController.text.trim(),
              pinCode: addressController.pinCodeController.text.trim(),
            ).toJson();
            FirebaseFirestore.instance
                .collection("users")
                .doc(sharedPreferences!.getString("uid"))
                .collection("userAddress")
                .doc(DateTime.now().millisecondsSinceEpoch.toString())
                .set(address)
                .then((value) {
              addressController.addressFormkey.currentState!.reset();
              Navigator.pop(context); //pop loading
              Navigator.pop(context); //pop save_address_page
            });
          }
        },
      );
    },
  );
}
