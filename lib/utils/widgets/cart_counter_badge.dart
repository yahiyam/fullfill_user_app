import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/features/view_model/cart/cart_item_counter_provider.dart';
import 'package:provider/provider.dart';

class CartIconWithBadge extends StatelessWidget {
  const CartIconWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemCounter>(
      builder: (context, counter, _) {
        return Visibility(
          visible: counter.count != 0,
          child: Positioned(
            child: Stack(
              children: [
                const Icon(
                  Icons.brightness_1,
                  size: 20.0,
                  color: black,
                ),
                Positioned(
                  top: 2,
                  right: 6,
                  child: Center(
                    child: Consumer<CartItemCounter>(
                      builder: (context, counter, _) {
                        return Text(
                          counter.count.toString(),
                          style: const TextStyle(
                            color: white,
                            fontSize: 12,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
