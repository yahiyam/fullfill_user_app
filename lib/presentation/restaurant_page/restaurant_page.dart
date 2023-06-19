import 'package:flutter/material.dart';

import 'package:fullfill_user_app/presentation/restaurant_page/widgets/app_bar.dart';
import 'package:fullfill_user_app/presentation/restaurant_page/widgets/body_section.dart';

import 'package:fullfill_user_app/data/models/sellers.dart';

import 'package:fullfill_user_app/globals/colors.dart';

class RestaurantPage extends StatelessWidget {
  final Sellers seller;

  const RestaurantPage({
    super.key,
    required this.seller,
  });

  @override
  Widget build(BuildContext context) {
    final scrolledNotifier = ValueNotifier<bool>(false);
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset > 0) {
        scrolledNotifier.value = true;
      } else {
        scrolledNotifier.value = false;
      }
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder<bool>(
          valueListenable: scrolledNotifier,
          builder: (context, isScrolled, _) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                buildAppBar(context, seller, scrolledNotifier),
                buildBodySection(seller),
              ],
            );
          }),
    );
  }
}
