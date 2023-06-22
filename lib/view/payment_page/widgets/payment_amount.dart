import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/global/strings.dart';

import 'package:fullfill_user_app/view/cart_page/providers/total_amount.dart';

Row buildDisplayAmount(BuildContext context) {
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
