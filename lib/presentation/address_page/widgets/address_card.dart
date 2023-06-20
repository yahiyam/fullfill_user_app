import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.isSelected,
    required this.addressIndex,
    required this.onTap,
  });
  final bool isSelected;
  final int addressIndex;
  final VoidCallback onTap;

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
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thelma Sara-bear',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Trasaco hotel, behind navrongo campus',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    '+233 5413 8989',
                    style: TextStyle(fontSize: 13),
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
