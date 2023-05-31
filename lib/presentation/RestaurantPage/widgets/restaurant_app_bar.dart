import 'package:flutter/material.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({
    super.key,
    this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            scaffoldKey?.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
