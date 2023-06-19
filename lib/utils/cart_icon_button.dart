import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/presentation/cart_page/cart_page.dart';
import 'package:fullfill_user_app/presentation/cart_page/providers/cart_item_counter_provider.dart';
import 'package:provider/provider.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    super.key,
    this.isScrolledUp,
    required this.sellerUID,
  });

  final bool? isScrolledUp;
  final String sellerUID;

  Color? cartColor() {
    if (isScrolledUp != null) {
      if (isScrolledUp!) {
        return commonColor;
      } else {
        return backgroundColor;
      }
    } else {
      return black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: cartColor(),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CartPage(sellerUID: sellerUID),
            ));
          },
        ),
        Positioned(
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
                  child:
                      Consumer<CartItemCounter>(builder: (context, count, _) {
                    return Text(
                      count.count.toString(),
                      style: const TextStyle(
                        color: white,
                        fontSize: 12,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
