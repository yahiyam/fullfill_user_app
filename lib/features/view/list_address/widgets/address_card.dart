import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../data/models/address.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.address,
    required this.onDelete,
    required this.isLongPressed,
    required this.onLongPress,
  });
  final bool isSelected;
  final VoidCallback onTap;
  final Address address;
  final VoidCallback onDelete;
  final bool isLongPressed;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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
              Row(
                children: [
                  Visibility(
                    visible: isLongPressed,
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: red,
                      ),
                      onPressed: onDelete,
                    ),
                  ),
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: commonColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
