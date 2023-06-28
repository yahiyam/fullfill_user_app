import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/data/models/seller.dart';

import 'package:fullfill_user_app/view/cart/cart_page.dart';

import 'package:fullfill_user_app/view/cart/functions/assistant_methods.dart';
import 'package:fullfill_user_app/view_model/cart/cart_item_counter_provider.dart';

import 'package:fullfill_user_app/utils/alert_message.dart';
import 'package:fullfill_user_app/utils/widgets/cart_counter_badge.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({super.key, required this.seller});
  final Seller seller;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      leading: IconButton(
        onPressed: () {
          // bool isCartNotEmpty = Provider.of<CartItemCounter>(context).count != 0;
          bool isCartNotEmpty = context.read<CartItemCounter>().count != 0;
          if (isCartNotEmpty) {
            showAlertMessege(
              context,
              message: 'Your cart will be cleared from this Restaurant!',
              onOKTap: () {
                clearCartNow(context);
              },
            );
          } else {
            Navigator.of(context).pop();
          }
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),

      // AppBarTitle
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
              color: black,
            ),
          ),

          // CartIconButton
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: black,
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
              const CartIconWithBadge(),
            ],
          )
        ],
      ),
      expandedHeight: Screen.height(25),
      backgroundColor: backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        // AppBarBackground
        background: Container(
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
                    //RatingChips
                    const Column(
                      children: [
                        Chip(label: Text('Free')),
                        Chip(label: Text('4.8')),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
