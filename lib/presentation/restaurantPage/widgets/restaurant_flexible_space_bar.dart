import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/models/sellers.dart';

class RestaurantFlexibleSpaceBar extends StatelessWidget {
  const RestaurantFlexibleSpaceBar({
    super.key,
    required this.seller,
  });
  final Sellers seller;
  final double appBarHeight = 66.0;
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return FlexibleSpaceBar(
      background: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + appBarHeight,
        decoration: const BoxDecoration(
          color: commonColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: screen.height / 3.5 / 2.5,
                    width: screen.width / 5 * 3,
                    child:  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        seller.sellerName??'Restaurant Name',
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          height: 1.2025,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Chip(label: Text('free')),
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
    );
  }
}
