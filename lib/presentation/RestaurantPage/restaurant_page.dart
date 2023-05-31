import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/common_widgets/custom_drawer.dart';
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
      drawer: const CustomDrawer(),
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
                  flexibleSpace: const RestaurantFlexibleSpaceBar(),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTabBarDelegate(
                  child: const TabBar(
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
              // Widget for Tab 1
              Center(child: Text('Tab 1')),
              // Widget for Tab 2
              Center(child: Text('Tab 2')),
              // Widget for Tab 3
              Center(child: Text('Tab 3')),
              // Widget for Tab 4
              Center(child: Text('Tab 4')),
            ],
          ),
        ),
      ),
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
      color: Colors.white,
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
