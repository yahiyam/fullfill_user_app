import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/common_widgets/custom_drawer.dart';

import '../HomePage/widgets/heading_title.dart';
import 'widgets/restaurant_app_bar.dart';
import 'widgets/restaurant_flexiable_space_bar.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            title: RestaurantAppBar(scaffoldKey: scaffoldKey),
            expandedHeight: screen.height / 3.5,
            flexibleSpace: const RestaurantFlexiableSpaceBar(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const HeadingTitle(title: 'Dinner'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
