import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/instence.dart';
import 'package:fullfill_user_app/presentation/address_page/providers/address_select_provider.dart';
import 'package:fullfill_user_app/presentation/address_page/widgets/address_card.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';
import 'package:provider/provider.dart';

Expanded buildAddressList() {
  return Expanded(
    child: Consumer<AddressSelectionProvider>(
        builder: (context, addressProvider, _) {
      if (addressProvider.addresses.isEmpty) {
        return const EmptyPageMessege(
          icon: Icons.import_contacts_rounded,
          mainTitle: 'No Addresses',
          subTitle: 'Add a new address to continue.',
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
      );
    }),
  );
}
