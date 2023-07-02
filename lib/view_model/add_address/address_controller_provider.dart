import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AddressControllerProvider with ChangeNotifier {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _addressLine = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _pinCode = TextEditingController();
  final TextEditingController _fullAddressController = TextEditingController();

  TextEditingController get nameController => _name;
  TextEditingController get phoneNumberController => _phoneNumber;
  TextEditingController get addressLineController => _addressLine;
  TextEditingController get cityController => _city;
  TextEditingController get stateController => _state;
  TextEditingController get countryController => _country;
  TextEditingController get pinCodeController => _pinCode;
  TextEditingController get fullAddressController => _fullAddressController;

  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get addressFormkey => _addressFormKey;
  
  Position? _position;
  Position? get position => _position;
  set position(Position? newPosition) {
    _position = newPosition;
    notifyListeners();
  }

  Future<Position?> getUserCoordinates(context) async {
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
      return position;
    } catch (e) {
      log('getUserLocationAddress error \n $e');
      return null;
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _phoneNumber.dispose();
    _addressLine.dispose();
    _city.dispose();
    _state.dispose();
    _country.dispose();
    _pinCode.dispose();
    _fullAddressController.dispose();
    super.dispose();
  }
}
