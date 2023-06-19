import 'package:flutter/material.dart';

import 'package:fullfill_user_app/presentation/home_page/widgets/app_bar.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/custom_drawer.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/header.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/restaurent_sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: [
          buildHeader(),
          buildRestaurantsSection(),
          buildRestaurantList(),
        ],
      ),
    );
  }
}
