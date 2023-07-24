import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/common_button.dart';
import '../../../../utils/screen_size.dart';
import '../../../view_model/add_address/address_controller_provider.dart';
import '../../../view_model/list_address/address_select_provider.dart';
import '../../add_address/save_address.dart';
import '../../payment/payment_page.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key, required this.sellerUID});
  final String sellerUID;
  @override
  Widget build(BuildContext context) {
    final bool isAddressesEmpty =
        context.read<AddressSelectionProvider>().addresses.isEmpty;
    return Column(
      children: [
        SizedBox(height: Screen.height(1)),
        CommonButton(
          isWhite: true,
          title: 'Add New Address',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                  create: (context) => AddressControllerProvider(),
                  child: const SaveAddressPage()),
            ));
          },
        ),
        SizedBox(height: Screen.height(1)),
        Visibility(
          visible: !isAddressesEmpty,
          child: CommonButton(
            title: 'Proceed to payment',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PaymentPage(sellerUID: sellerUID),
              ));
            },
          ),
        ),
        SizedBox(height: Screen.height(3)),
      ],
    );
  }
}
