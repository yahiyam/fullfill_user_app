import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/header.dart';
import 'widgets/restaurent_sections.dart';

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
