import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/view_model/cart/cart_item_counter_provider.dart';
import 'package:provider/provider.dart';

Widget buildCartIconCounter() {
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
