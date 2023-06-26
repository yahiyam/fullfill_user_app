import 'package:flutter/material.dart';

import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/screen_size.dart';

import 'package:fullfill_user_app/view/save_address/widgets/address_form.dart';
import 'package:fullfill_user_app/view/save_address/widgets/save_address_button.dart';
import 'package:fullfill_user_app/view/save_address/widgets/show_current_address.dart';

import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';
import 'package:fullfill_user_app/utils/functions/simple_heading.dart';

class SaveAddressPage extends StatelessWidget {
  const SaveAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSimpleAppBar(context, title: 'Save New Address'),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildShowCurrentAddress(context),
              SizedBox(height: Screen.height(8)),
              buildSimpleHeading('Save new Address here'),
              buildAddressForm(),
              SizedBox(height: Screen.height(8)),
              buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
