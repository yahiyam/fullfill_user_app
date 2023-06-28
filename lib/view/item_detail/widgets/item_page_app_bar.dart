import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/item.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/widgets/cart_counter_badge.dart';
import 'package:fullfill_user_app/view/cart/cart_page.dart';

AppBar buildItemAppBar(BuildContext context, Item item) {
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

Widget buildCartIconButton(BuildContext context, Item item) {
  return Stack(
    children: [
      IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CartPage(sellerUID: item.sellerUID!),
        )),
      ),
      buildCartIconCounter(),
    ],
  );
}

