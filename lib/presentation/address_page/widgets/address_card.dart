import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/address.dart';
import 'package:fullfill_user_app/globals/colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.isSelected,
    required this.addressIndex,
    required this.onTap,
    required this.address,
  });
  final bool isSelected;
  final int addressIndex;
  final VoidCallback onTap;
  final Address address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: Screen.height(10),
        // width: Screen.width(90),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? commonColor.withAlpha(50) : grey300,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name ?? 'Name',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    address.addressLine ?? 'Address Line',
                    style: const TextStyle(fontSize: 13),
                  ),
                  Text(
                    address.phoneNumber ?? 'Phone Number',
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: commonColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
