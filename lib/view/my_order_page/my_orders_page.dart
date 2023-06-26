import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/view/my_order_page/provider/order_status_provider.dart';
import 'package:fullfill_user_app/view/my_order_page/tabs/completed_order.dart';
import 'package:fullfill_user_app/view/my_order_page/tabs/pending_order.dart';

import 'package:fullfill_user_app/global/colors.dart';

import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderStatusProvider>(context);
    orderProvider.fetchOrderpending();
    orderProvider.fetchOrderCompleted();

    return Scaffold(
      appBar: buildSimpleAppBar(context, title: 'My Orders'),
      backgroundColor: backgroundColor,
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PendingOrder(),
                  CompletedOrder(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
