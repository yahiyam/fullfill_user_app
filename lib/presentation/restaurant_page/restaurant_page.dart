import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/assistent_methods/progress_bar.dart';
import 'package:fullfill_user_app/models/categories.dart';
import 'package:fullfill_user_app/models/items.dart';
import 'package:fullfill_user_app/models/sellers.dart';
import 'package:fullfill_user_app/presentation/restaurant_page/widgets/menu_food_card.dart';
import '../../globals/colors.dart';
import 'widgets/restaurant_app_bar.dart';
import 'widgets/restaurant_flexible_space_bar.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({
    super.key,
    required this.seller,
  });
  final Sellers seller;
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            title: RestaurantAppBar(
              sellerUID: seller.sellerUID!,
              scrollController: scrollController,
            ),
            expandedHeight: screen.height / 4,
            backgroundColor: backgroundColor,
            flexibleSpace: RestaurantFlexibleSpaceBar(seller: seller),
          ),
          StreamBuilder<QuerySnapshot>(
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
                  child: Center(child: Text('No categories available')),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Categories category = Categories.fromJson(
                        snapshot.data!.docs[index].data()!
                            as Map<String, dynamic>);
                    return RestaurantItems(category: category);
                  },
                  childCount: snapshot.data!.docs.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RestaurantItems extends StatelessWidget {
  const RestaurantItems({
    super.key,
    required this.category,
  });
  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      color: backgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                category.menuTitle ?? 'category name',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 100),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'see more',
                  style: TextStyle(color: commonColor),
                ),
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("sellers")
                .doc(category.sellerUID)
                .collection("menus")
                .doc(category.menuID)
                .collection("items")
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
                  child: Center(child: Text('No categories available')),
                );
              }

              // List<Sellers> sellersList = snapshot.data!.docs
              //     .map((doc) =>
              //         Sellers.fromJson(doc.data() as Map<String, dynamic>))
              //     .toList();
              return SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Items item = Items.fromJson(snapshot.data!.docs[index]
                        .data()! as Map<String, dynamic>);
                    return MenuFoodCard(item: item);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
