import 'package:flutter/material.dart';

import 'package:fullfill_user_app/view/home/widgets/app_bar.dart';
import 'package:fullfill_user_app/view/home/widgets/custom_drawer.dart';
import 'package:fullfill_user_app/view/home/widgets/header.dart';
import 'package:fullfill_user_app/view/home/widgets/restaurent_sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: UserDrawer(),
      appBar: HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          WelcomeHeader(),
          RestaurantSectionHeading(),
          RestaurantsList(),
        ],
      ),
    );
  }
}
