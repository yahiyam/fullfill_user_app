import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/presentation/address_page/providers/address_select_provider.dart';
import 'package:fullfill_user_app/presentation/address_page/widgets/address_card.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';
import 'package:provider/provider.dart';

Expanded buildAddressList() {
  return Expanded(
    child: Consumer<AddressSelectionProvider>(
        builder: (context, addressProvider, _) {
      if (addressProvider.addresses.isEmpty) {
        return Padding(
          padding: EdgeInsets.only(top: Screen.height(15)),
          child: const EmptyPageMessege(
            icon: Icons.import_contacts_rounded,
            mainTitle: 'No Addresses',
            subTitle: 'Add a new address to continue.',
          ),
        );
      }
      return ListView.builder(
        shrinkWrap: true,
        itemCount: addressProvider.addresses.length,
        itemBuilder: (context, index) {
          final isSelected = index == addressProvider.selectedAddressIndex;
          final address = addressProvider.addresses[index];

          return AddressCard(
            isSelected: isSelected,
            addressIndex: index,
            address: address,
            onTap: () => addressProvider.selectAddress(index),
          );
        },
      );
    }),
  );
}
