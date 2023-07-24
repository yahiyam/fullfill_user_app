import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/screen_size.dart';
import '../../../data/models/seller.dart';
import 'restaurant_card.dart';


class RestaurantSectionHeading extends StatelessWidget {
  const RestaurantSectionHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: Screen.width(5),
          top: Screen.width(5),
        ),
        child: const Text(
          'Restaurants',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("sellers").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(commonColor),
                  ),
                )),
              ],
            ),
          );
        }

        final List<Seller> sellersList = snapshot.data!.docs
            .map((doc) => Seller.fromJson(doc.data() as Map<String, dynamic>))
            .toList();

        if (sellersList.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('No restaurants available'),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final Seller seller = sellersList[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Screen.width(5),
                  vertical: Screen.width(3),
                ),
                child: RestaurantCard(seller: seller),
              );
            },
            childCount: sellersList.length,
          ),
        );
      },
    );
  }
}
