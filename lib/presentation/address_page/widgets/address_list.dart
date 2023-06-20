import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/address_page/providers/address_select_provider.dart';
import 'package:fullfill_user_app/presentation/address_page/widgets/address_card.dart';
import 'package:provider/provider.dart';

Consumer<AddressSelectionProvider> buildAddressList() {
  return Consumer<AddressSelectionProvider>(
      builder: (context, addressProvider, _) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final isSelected = index == addressProvider.selectedAddressIndex;
        return AddressCard(
          isSelected: isSelected,
          addressIndex: index,
          onTap: () => addressProvider.selectAddress(index),
        );
      },
    );
  });
}
