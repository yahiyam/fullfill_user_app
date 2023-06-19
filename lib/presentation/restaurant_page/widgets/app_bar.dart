import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/data/models/sellers.dart';

import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';

import 'package:fullfill_user_app/presentation/cart_page/cart_page.dart';
import 'package:fullfill_user_app/presentation/cart_page/providers/cart_item_counter_provider.dart';

Widget buildAppBar(BuildContext context, Sellers seller) {
  return SliverAppBar(
    pinned: true,
    floating: true,
    automaticallyImplyLeading: false,
    title: _buildAppBarTitle(context, seller),
    expandedHeight: Screen.height(25),
    backgroundColor: backgroundColor,
    flexibleSpace: FlexibleSpaceBar(
      background: _buildAppBarBackground(seller),
    ),
  );
}

Widget _buildAppBarTitle(BuildContext context, Sellers seller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: commonColor,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite_outline,
          color: commonColor,
        ),
      ),
      _buildCartIconButton(context, seller),
    ],
  );
}

Widget _buildCartIconButton(BuildContext context, Sellers seller) {
  return Stack(
    children: [
      IconButton(
        icon: const Icon(
          Icons.shopping_cart,
          color: commonColor,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartPage(
                sellerUID: seller.sellerUID!,
              ),
            ),
          );
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
                child: Consumer<CartItemCounter>(
                  builder: (context, count, _) {
                    return Text(
                      count.count.toString(),
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
    ],
  );
}

Widget _buildAppBarBackground(Sellers seller) {
  return Container(
    decoration: const BoxDecoration(
      color: commonColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  seller.sellerName ?? 'Restaurant Name',
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 40,
                    height: 1.2,
                    color: white,
                  ),
                ),
              ),
              _buildRatingChips(),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}

Widget _buildRatingChips() {
  return const Column(
    children: [
      Chip(label: Text('Free')),
      Chip(label: Text('4.8')),
    ],
  );
}
