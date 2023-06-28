import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/seller.dart';

import 'package:fullfill_user_app/view/cart/cart_page.dart';
import 'package:fullfill_user_app/view_model/cart/cart_item_counter_provider.dart';

import 'package:fullfill_user_app/utils/common_button.dart';

Visibility buildBottomButton(
  CartItemCounter cart,
  BuildContext context,
  Seller seller,
) {
  return Visibility(
    visible: cart.count != 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CommonButton(
        title: 'Go to Cart',
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CartPage(sellerUID: seller.sellerUID!),
          ));
        },
      ),
    ),
  );
}
