import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_app/features/view/add_address/widgets/text_field.dart';
import 'package:user_app/features/view_model/add_address/address_controller_provider.dart';
import 'package:provider/provider.dart';


class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressControllerProvider>(
      builder: (context, addressController, _) {
        return Form(
          key: addressController.addressFormkey,
          child: Column(
            children: [
              AddressTextField(
                controller: addressController.nameController,
                label: 'Name',
              ),
              AddressTextField(
                controller: addressController.phoneNumberController,
                label: 'Phone Number',
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              AddressTextField(
                controller: addressController.addressLineController,
                label: 'Address Line',
              ),
              AddressTextField(
                controller: addressController.cityController,
                label: 'City',
              ),
              Row(
                children: [
                  Expanded(
                    child: AddressTextField(
                      controller: addressController.stateController,
                      label: 'State',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AddressTextField(
                      controller: addressController.pinCodeController,
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
                controller: addressController.countryController,
                label: 'Country',
              ),
            ],
          ),
        );
      },
    );
  }
}
