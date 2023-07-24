import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../utils/widgets/simple_app_bar.dart';
import '../../view_model/my_orders/order_status_provider.dart';
import 'tabs/completed_order.dart';
import 'tabs/pending_order.dart';
class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderStatusProvider>(context);
    orderProvider.fetchOrderpending();
    orderProvider.fetchOrderCompleted();

    return Scaffold(
      appBar: const SimpleAppBar(title: 'My Orders'),
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
