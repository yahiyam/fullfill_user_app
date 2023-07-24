import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/empty_page_message.dart';
import '../../../../utils/instence.dart';
import '../../../view_model/list_address/address_select_provider.dart';
import 'address_card.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AddressSelectionProvider>(
        builder: (context, addressProvider, _) {
          if (addressProvider.addresses.isEmpty) {
            return const EmptyPageMessage(
              icon: Icons.import_contacts_rounded,
              mainTitle: 'No Addresses',
              subTitle: 'Add a new address to continue.',
            );
          }
          return GestureDetector(
            onTap: () => addressProvider.clearLongPressedState(),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: addressProvider.addresses.length,
              itemBuilder: (context, index) {
                final isSelected =
                    index == addressProvider.selectedAddressIndex;
                final address = addressProvider.addresses[index];

                return AddressCard(
                  isSelected: isSelected,
                  address: address,
                  onTap: () {
                    addressProvider.selectAddress(index);
                    addressProvider.clearLongPressedState();
                  },
                  isLongPressed: addressProvider.isAddressLongPressed(index),
                  onDelete: () {
                    addressProvider.deleteAddress(
                      index,
                      sharedPreferences!.getString("uid"),
                    );
                  },
                  onLongPress: () {
                    addressProvider.toggleAddressLongPressed(index);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
