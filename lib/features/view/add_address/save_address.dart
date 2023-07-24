import 'package:flutter/material.dart';

import 'package:user_app/constants/colors.dart';
import 'package:user_app/features/view/add_address/widgets/address_form.dart';
import 'package:user_app/features/view/add_address/widgets/save_address_button.dart';
import 'package:user_app/features/view/add_address/widgets/show_current_address.dart';
import 'package:user_app/utils/screen_size.dart';


import 'package:user_app/utils/widgets/simple_app_bar.dart';
import 'package:user_app/utils/widgets/simple_heading.dart';

class SaveAddressPage extends StatelessWidget {
  const SaveAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Save New Address'),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CurrentAddress(),
              SizedBox(height: Screen.height(8)),
              const SimpleHeading(title: 'Save new Address here'),
              const AddressForm(),
              SizedBox(height: Screen.height(8)),
              const SaveAddressButton(),
            ],
          ),
        ),
      ),
    );
  }
}
