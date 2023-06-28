import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:provider/provider.dart';


import 'package:fullfill_user_app/view_model/list_address/address_select_provider.dart';

import 'package:fullfill_user_app/view/list_address/widgets/address_bottom_buttons.dart';
import 'package:fullfill_user_app/view/list_address/widgets/address_list.dart';

import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';
import 'package:fullfill_user_app/utils/functions/simple_heading.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({
    super.key,
    required this.sellerUID,
  });

  final String sellerUID;

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressSelectionProvider>(context);
    addressProvider.fetchAddresses();
    return Scaffold(
      appBar: buildSimpleAppBar(context, title: 'Deliver To'),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          buildSimpleHeading('Address details'),
          buildAddressList(),
          buildBottomButtons(context, sellerUID),
        ],
      ),
    );
  }
}
