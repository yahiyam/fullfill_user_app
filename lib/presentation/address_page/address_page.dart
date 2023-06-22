import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/instence.dart';

import 'package:fullfill_user_app/presentation/address_page/providers/address_select_provider.dart';

import 'package:fullfill_user_app/presentation/address_page/widgets/address_bottom_buttons.dart';
import 'package:fullfill_user_app/presentation/address_page/widgets/address_list.dart';

import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';
import 'package:fullfill_user_app/utils/functions/simple_heading.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressSelectionProvider>(context);
    addressProvider.fetchAddresses(sharedPreferences!.getString("uid"));
    return Scaffold(
      appBar: buildSimpleAppBar(context, 'Deliver To'),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          buildSimpleHeading('Address details'),
          buildAddressList(),
          buildBottomButtons(context),
        ],
      ),
    );
  }
}
