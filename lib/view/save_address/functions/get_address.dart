import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/view/save_address/provider/address_controller_provider.dart';

Future<void> getUserLocationAddress(context) async {
  AddressControllerProvider addressController = Provider.of<AddressControllerProvider>(context, listen: false);

  try {
    bool servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      log('service disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark>? placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark pMark = placemarks[0];

    addressController.addressLineController.text = '${pMark.subLocality} ${pMark.locality}';
    addressController.cityController.text = '${pMark.subAdministrativeArea}';
    addressController.stateController.text = '${pMark.administrativeArea} ';
    addressController.countryController.text = '${pMark.country}';
    addressController.pinCodeController.text = '${pMark.postalCode}';
    String fullAddress = '${addressController.addressLineController.text}, ${addressController.cityController.text}, ${addressController.stateController.text}, ${addressController.countryController.text}, ${addressController.pinCodeController.text}';
    addressController.fullAddressController.text = fullAddress;
  } catch (e) {
    log('getUserLocationAddress error \n $e');
  }
}
