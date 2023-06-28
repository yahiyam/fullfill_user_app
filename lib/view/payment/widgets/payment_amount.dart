import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/strings.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/view_model/cart/total_amount.dart';

class DisplayAmount extends StatelessWidget {
  const DisplayAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Total Amount',
          style: TextStyle(fontSize: 17),
        ),
        Text(
          '$rupee${context.read<TotalAmount>().grandTotal.toString()}',
          style: const TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
