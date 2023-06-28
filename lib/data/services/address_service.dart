import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fullfill_user_app/data/models/address.dart';
import 'package:fullfill_user_app/utils/instence.dart';

class AddressService {
  Future<List<Address>> fetchAddresses() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(sharedPreferences!.getString("uid"))
          .collection('userAddress')
          .get();

      return querySnapshot.docs.map((doc) {
        final address = Address.fromJson(doc.data());
        address.id = doc.id;
        return address;
      }).toList();
    } catch (e) {
      log("Error fetching addresses: $e");
      return [];
    }
  }

  Future<void> deleteAddress(String phoneNumber) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(sharedPreferences!.getString("uid"))
          .collection('userAddress')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          doc.reference.delete();
        }
      });
    } catch (e) {
      log("Error deleting address: $e");
    }
  }
}
