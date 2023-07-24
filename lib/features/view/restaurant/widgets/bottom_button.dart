import 'package:flutter/material.dart';

import '../../../../utils/common_button.dart';
import '../../../data/models/seller.dart';
import '../../../view_model/cart/cart_item_counter_provider.dart';
import '../../cart/cart_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.cart,
    required this.seller,
  });

  final CartItemCounter cart;
  final Seller seller;

  @override
  Widget build(BuildContext context) {
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
}
