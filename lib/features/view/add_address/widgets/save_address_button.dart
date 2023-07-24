import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_app/features/view_model/add_address/address_controller_provider.dart';
import 'package:user_app/utils/instence.dart';
import 'package:provider/provider.dart';

import 'package:user_app/features/data/models/address.dart';


import 'package:user_app/utils/common_button.dart';
import 'package:user_app/utils/widgets/full_screen_loading.dart';

class SaveAddressButton extends StatelessWidget {
  const SaveAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressControllerProvider>(
      builder: (context, addressController, _) {
        return CommonButton(
          title: 'Save Address',
          onTap: () {
            if (addressController.addressFormkey.currentState!.validate()) {
              FullScreenLoading.show(context);
              final address = Address(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: addressController.nameController.text.trim(),
                phoneNumber: addressController.phoneNumberController.text.trim(),
                addressLine: addressController.addressLineController.text.trim(),
                city: addressController.cityController.text.trim(),
                state: addressController.stateController.text.trim(),
                country: addressController.countryController.text.trim(),
                pinCode: addressController.pinCodeController.text.trim(),
                lat: addressController.position?.latitude ?? 0,
                lng: addressController.position?.longitude ?? 0,
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
}
