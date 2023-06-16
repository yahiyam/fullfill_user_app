import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/assistent_methods/progress_bar.dart';
import 'package:fullfill_user_app/models/sellers.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/custom_drawer.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/heading_title.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/home_app_bar.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/home_flexiable_space_bar.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/restaurant_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const HomeAppBar(),
            expandedHeight: screen.height / 3.5,
            flexibleSpace: const HomeFlexibleSpaceBar(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [const HeadingTitle(title: 'Restaurants')],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("sellers").snapshots(),
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
                  child: Center(child: Text('No restaurants available')),
                );
              }

              List<Sellers> sellersList = snapshot.data!.docs
                  .map((doc) =>
                      Sellers.fromJson(doc.data() as Map<String, dynamic>))
                  .toList();

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Sellers seller = sellersList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screen.width * .05,
                        vertical: screen.width * .03,
                      ),
                      child: RestaurantCard(seller: seller),
                    );
                  },
                  childCount: sellersList.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
