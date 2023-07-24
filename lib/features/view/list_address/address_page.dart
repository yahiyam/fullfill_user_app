import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../utils/widgets/simple_app_bar.dart';
import '../../../utils/widgets/simple_heading.dart';
import '../../view_model/list_address/address_select_provider.dart';
import 'widgets/address_bottom_buttons.dart';
import 'widgets/address_list.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key, required this.sellerUID});

  final String sellerUID;

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressSelectionProvider>(context);
    addressProvider.fetchAddresses();
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Deliver To'),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const SimpleHeading(title: 'Address details'),
          const AddressList(),
          BottomButtons(sellerUID: sellerUID),
        ],
      ),
    );
  }
}
