import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/models/sellers.dart';
import 'package:fullfill_user_app/presentation/restaurantPage/restaurant_page.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.seller,
  });
  final Sellers seller;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return InkWell(
      splashColor: transparent,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RestaurantPage(seller: seller)));
      },
      child: Stack(
        children: [
          Container(
            height: screen.height * .26,
            width: screen.width * .9,
            decoration: BoxDecoration(
              //background image
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(seller.sellerAvatarUrl!)),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: commonColor.withAlpha(50),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
          ),
          Container(
            height: screen.height * .06,
            width: screen.width * .9,
            margin: EdgeInsets.only(top: screen.height * .2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: screen.width * .05),
                    SizedBox(
                      width: screen.width * .5,
                      child: Text(
                        // restaurant name
                        seller.sellerName ?? 'Restaurent Name',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.2025,
                          color: black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.delivery_dining_rounded,
                          color: commonColor,
                        ),
                        // delivery time
                        Text('58 min'),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: commonColor,
                        ),
                        // rating
                        Text('4.8'),
                      ],
                    ),
                    SizedBox(width: screen.width * .05),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
