import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/address.dart';
import 'package:fullfill_user_app/globals/instence.dart';
import 'package:fullfill_user_app/utils/toast_message.dart';

void saveAddressInfo(
  BuildContext context,
  formKey,
  name,
  state,
  completeAddress,
  phoneNumber,
  flatNumber,
  city,
  position,
) {
  if (formKey.currentState!.validate()) {
    final model = Address(
      name: name.text.trim(),
      state: state.text.trim(),
      fullAddress: completeAddress.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      addressLine: flatNumber.text.trim(),
      city: city.text.trim(),
      lat: position!.latitude,
      lng: position!.longitude,
    ).toJson();

    FirebaseFirestore.instance
        .collection("users")
        .doc(sharedPreferences!.getString("uid"))
        .collection("userAddress")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(model)
        .then((value) {
      ToastMessage.show(context, "New Address has been saved.");
      formKey.currentState!.reset();
    });
  }
}
