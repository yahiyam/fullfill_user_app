import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard({
    super.key,
    required this.type,
    required this.icon,
    this.iconBGcolor,
    this.isSelected = false,
    required this.onTap,
  });

  final String type;
  final IconData icon;
  final Color? iconBGcolor;
  final bool? isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        type,
        style: const TextStyle(fontSize: 17),
      ),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: iconBGcolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: white,
        ),
      ),
      trailing: isSelected!
          ? const Icon(
              Icons.adjust_rounded,
              color: commonColor,
            )
          : const Icon(
              Icons.fiber_manual_record_outlined,
              color: grey,
            ),
    );
  }
}
