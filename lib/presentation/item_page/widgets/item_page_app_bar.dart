import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/presentation/cart_page/cart_page.dart';
import 'package:fullfill_user_app/presentation/cart_page/providers/cart_item_counter_provider.dart';
import 'package:provider/provider.dart';

AppBar buildItemAppBar(BuildContext context, Items item) {
  return AppBar(
    backgroundColor: backgroundColor,
    actions: [
      buildFavoriteIconButton(),
      buildCartIconButton(context, item),
    ],
  );
}

IconButton buildFavoriteIconButton() {
  return IconButton(
    onPressed: () {},
    icon: const Icon(Icons.favorite_border),
  );
}

Widget buildCartIconButton(BuildContext context, Items item) {
  return Stack(
    children: [
      IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CartPage(sellerUID: item.sellerUID!),
        )),
      ),
      Positioned(
        child: buildCartIconCounter(),
      ),
    ],
  );
}

Widget buildCartIconCounter() {
  return Stack(
    children: [
      const Icon(
        Icons.brightness_1,
        size: 20.0,
        color: Colors.black,
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
                  color: Colors.white,
                  fontSize: 12,
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}
