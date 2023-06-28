import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fullfill_user_app/data/models/category.dart';
import 'package:fullfill_user_app/data/models/item.dart';
import 'package:fullfill_user_app/data/models/seller.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';

import 'package:fullfill_user_app/view/restaurant/widgets/menu_food_card.dart';

import 'package:fullfill_user_app/utils/empty_page_message.dart';
import 'package:fullfill_user_app/utils/progress_bar.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key, required this.seller});
  final Seller seller;
  @override
  Widget build(BuildContext context) {
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
              final category = Category.fromJson(
                snapshot.data!.docs[index].data()! as Map<String, dynamic>,
              );

              // CategoryContainer
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
                            category.menuTitle?.toUpperCase() ??
                                'Category Name',
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
                      // ItemsList
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("sellers")
                            .doc(category.sellerUID!)
                            .collection("menus")
                            .doc(category.menuID!)
                            .collection("items")
                            .orderBy("publishedDate", descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return circularProgress();
                          }

                          if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: EmptyPageMessage(
                                icon: Icons.sentiment_neutral_rounded,
                                mainTitle: 'No items available!',
                                subTitle:
                                    "This seller hasn't updated any items here.",
                              ),
                            );
                          }

                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(10),
                            itemCount: snapshot.data!.docs.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              final item = Item.fromJson(
                                snapshot.data!.docs[index].data()!
                                    as Map<String, dynamic>,
                              );

                              return MenuFoodCard(item: item);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: snapshot.data!.docs.length,
          ),
        );
      },
    );
  }
}
