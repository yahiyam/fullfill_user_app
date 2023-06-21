import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
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
  final TextEditingController _flatNumber = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _completeAddress = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();

  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  String _currentAddress = '';

  Future<Position> _getUserCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      log('service disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentLocation!.latitude,
        _currentLocation!.altitude,
      );
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "${place.locality},${place.country}";
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _phoneNumber.dispose();
    _flatNumber.dispose();
    _city.dispose();
    _state.dispose();
    _completeAddress.dispose();
    _locationController.dispose();
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
                      controller: _locationController,
                      decoration: const InputDecoration(
                        labelText: "What's your address?",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        _currentLocation = await _getUserCurrentLocation();
                        await getAddressFromCoordinates();
                        setState(() {});
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
              // Text('data'),
              SizedBox(height: Screen.height(8)),
              Text(
                _currentAddress,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneNumber,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _city,
                      decoration: const InputDecoration(
                        labelText: 'City',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the city';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _state,
                      decoration: const InputDecoration(
                        labelText: 'State',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the state';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _flatNumber,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: 'Address Line',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the address line';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _completeAddress,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: 'Complete Address',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the complete address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: Screen.height(8)),
              CommonButton(
                title: 'Save Address',
                onTap: () {
                  if (_addressFormKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
