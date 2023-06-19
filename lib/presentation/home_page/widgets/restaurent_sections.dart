import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fullfill_user_app/data/models/sellers.dart';

import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';

import 'package:fullfill_user_app/presentation/home_page/widgets/restaurant_card.dart';

SliverToBoxAdapter buildRestaurantsSection() {
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

StreamBuilder<QuerySnapshot> buildRestaurantList() {
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

      final List<Sellers> sellersList = snapshot.data!.docs
          .map((doc) => Sellers.fromJson(doc.data() as Map<String, dynamic>))
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
            final Sellers seller = sellersList[index];
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
