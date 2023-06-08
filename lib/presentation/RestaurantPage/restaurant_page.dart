import 'package:flutter/material.dart';
import '../../Globals/colors.dart';
import 'widgets/menu_food_card.dart';
import 'widgets/restaurant_app_bar.dart';
import 'widgets/restaurant_flexible_space_bar.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final Size screen = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: grey200,
      
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  title: RestaurantAppBar(
                    scaffoldKey: scaffoldKey,
                    scrollController: scrollController,
                  ),
                  expandedHeight: screen.height / 3.5,
                  flexibleSpace: RestaurantFlexibleSpaceBar(),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTabBarDelegate(
                  child: const TabBar(
                    dividerColor: transparent,
                    labelColor: orange,
                    unselectedLabelColor: grey,
                    indicatorColor: orange,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    tabs: [
                      Tab(text: 'Foods'),
                      Tab(text: 'Drinks'),
                      Tab(text: 'Snacks'),
                      Tab(text: 'Sauce'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              RestaurantTab(),
              RestaurantTab(),
              RestaurantTab(),
              RestaurantTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantTab extends StatelessWidget {
  const RestaurantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 80),
          color: grey200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Dinner',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 100),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'see more',
                      style: TextStyle(color: orange),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300, // Set the desired height for the row
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const MenuFoodCard();
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          color: grey200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Lunch',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 100),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'see more',
                      style: TextStyle(color: orange),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300, // Set the desired height for the row
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const MenuFoodCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate({required this.child});

  final TabBar child;

  @override
  double get minExtent => child.preferredSize.height;
  @override
  double get maxExtent => child.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: grey200,
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
