import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fullfill_user_app/data/models/categories.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/data/models/sellers.dart';

import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/screen_size.dart';

import 'package:fullfill_user_app/view/restaurant_page/widgets/menu_food_card.dart';

import 'package:fullfill_user_app/utils/empty_page_message.dart';
import 'package:fullfill_user_app/utils/progress_bar.dart';

Widget buildBodySection(Sellers seller) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection("sellers")
        .doc(seller.sellerUID)
        .collection("menus")
        .orderBy("publishedDate", descending: true)
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return SliverToBoxAdapter(
          child: Center(child: Text('Error: ${snapshot.error}')),
        );
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return SliverToBoxAdapter(
          child: Center(child: circularProgress()),
        );
      }

      if (snapshot.data!.docs.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            child: EmptyPageMessage(
              icon: Icons.sentiment_neutral_rounded,
              mainTitle: 'No categories available!',
              subTitle: "This seller hasn't updated any Food.",
            ),
          ),
        );
      }

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final category = Categories.fromJson(
              snapshot.data!.docs[index].data()! as Map<String, dynamic>,
            );

            return _buildCategoryContainer(category);
          },
          childCount: snapshot.data!.docs.length,
        ),
      );
    },
  );
}

Widget _buildCategoryContainer(Categories category) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    color: backgroundColor,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.menuTitle?.toUpperCase() ?? 'Category Name',
                style: const TextStyle(fontSize: 25),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See More',
                  style: TextStyle(color: commonColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Screen.height(35),
          child: _buildItemsList(category.sellerUID!, category.menuID!),
        ),
      ],
    ),
  );
}

Widget _buildItemsList(String sellerUID, String menuID) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection("sellers")
        .doc(sellerUID)
        .collection("menus")
        .doc(menuID)
        .collection("items")
        .orderBy("publishedDate", descending: true)
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return circularProgress();
      }

      if (snapshot.data!.docs.isEmpty) {
        return const Center(
          child: EmptyPageMessage(
            icon: Icons.sentiment_neutral_rounded,
            mainTitle: 'No items available!',
            subTitle: "This seller hasn't updated any items here.",
          ),
        );
      }

      return ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        itemCount: snapshot.data!.docs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = Items.fromJson(
            snapshot.data!.docs[index].data()! as Map<String, dynamic>,
          );

          return MenuFoodCard(item: item);
        },
      );
    },
  );
}
