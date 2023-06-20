import 'package:flutter/material.dart';

import 'package:fullfill_user_app/presentation/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/presentation/restaurant_page/widgets/app_bar.dart';
import 'package:fullfill_user_app/presentation/restaurant_page/widgets/body_section.dart';

import 'package:fullfill_user_app/data/models/sellers.dart';

import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/utils/alert_message.dart';

class RestaurantPage extends StatelessWidget {
  final Sellers seller;

  const RestaurantPage({
    super.key,
    required this.seller,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await showAlertMessege(
          context,
          message: 'Your cart will be cleared from this store!',
          onOKTap: () {
            clearCartNow(context);
          },
        );

        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          slivers: [
            buildAppBar(context, seller),
            buildBodySection(seller),
          ],
        ),
      ),
    );
  }
}
