import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/instence.dart';
import 'package:fullfill_user_app/view_model/list_address/address_select_provider.dart';
import 'package:fullfill_user_app/view/list_address/widgets/address_card.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';
import 'package:provider/provider.dart';

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
