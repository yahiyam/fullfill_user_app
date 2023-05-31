import 'package:flutter/material.dart';
import 'widgets/restaurant_card.dart';
import 'widgets/heading_title.dart';
import 'widgets/home_app_bar.dart';
import '../common_widgets/custom_drawer.dart';
import 'widgets/home_flexiable_space_bar.dart';

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
            flexibleSpace: const HomeFlexiableSpaceBar(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const HeadingTitle(title: 'Restaurants'),
                const RestaurantCard(),
                const RestaurantCard(),
                const RestaurantCard(),
                const RestaurantCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
