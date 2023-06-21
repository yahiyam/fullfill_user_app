import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullfill_user_app/data/models/address.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/instence.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/presentation/save_address/widgets/text_field.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SaveAddressPage extends StatefulWidget {
  const SaveAddressPage({super.key});

  @override
  State<SaveAddressPage> createState() => _SaveAddressPageState();
}

class _SaveAddressPageState extends State<SaveAddressPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _addressLine = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _pinCode = TextEditingController();
  final TextEditingController _fullAddressController = TextEditingController();

  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();

  late final List<Placemark>? placemarks;
  late final Position? position;

  late bool servicePermission = false;
  late LocationPermission permission;

  Future<void> getUserLocationAddress() async {
    try {
      servicePermission = await Geolocator.isLocationServiceEnabled();
      if (!servicePermission) {
        log('service disabled');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      position = newPosition;

      placemarks = await placemarkFromCoordinates(
        position!.latitude,
        position!.longitude,
      );
      Placemark pMark = placemarks![0];

      _addressLine.text = '${pMark.subLocality} ${pMark.locality}';
      _city.text = '${pMark.subAdministrativeArea}';
      _state.text = '${pMark.administrativeArea} ';
      _country.text = '${pMark.country}';
      _pinCode.text = '${pMark.postalCode}';
      String fullAddress =
          '${_addressLine.text}, ${_city.text}, ${_state.text}, ${_country.text}, ${_pinCode.text}';
      _fullAddressController.text = fullAddress;
    } catch (e) {
      log('getUserLocationAddress error \n $e');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save New Address'),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 6,
                    child: TextField(
                      controller: _fullAddressController,
                      decoration: const InputDecoration(
                        labelText: "What's your address?",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        getUserLocationAddress();
                      },
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
              ),
              SizedBox(height: Screen.height(8)),
              const Text(
                'Save new Address here',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    AddressTextField(
                      controller: _name,
                      label: 'Name',
                    ),
                    AddressTextField(
                      controller: _phoneNumber,
                      label: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    AddressTextField(
                      controller: _addressLine,
                      label: 'Address Line',
                    ),
                    AddressTextField(
                      controller: _city,
                      label: 'City',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AddressTextField(
                            controller: _state,
                            label: 'State',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: AddressTextField(
                            controller: _pinCode,
                            label: 'PinCode',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                    AddressTextField(
                      controller: _country,
                      label: 'Country',
                    ),
                  ],
                ),
              ),
              SizedBox(height: Screen.height(8)),
              CommonButton(
                title: 'Save Address',
                onTap: () {
                  if (_addressFormKey.currentState!.validate()) {
                    final address = Address(
                      name: _name.text.trim(),
                      phoneNumber: _phoneNumber.text.trim(),
                      addressLine: _addressLine.text.trim(),
                      city: _city.text.trim(),
                      state: _state.text.trim(),
                      country: _country.text.trim(),
                      pinCode: _pinCode.text.trim(),
                    ).toJson();
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(sharedPreferences!.getString("uid"))
                        .collection("userAddress")
                        .doc(DateTime.now().millisecondsSinceEpoch.toString())
                        .set(address)
                        .then((value) {
                      _addressFormKey.currentState!.reset();
                      Navigator.pop(context);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
