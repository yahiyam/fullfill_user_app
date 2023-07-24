import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/my_orders/order_status_provider.dart';
import '../widgets/order_card.dart';
import '../widgets/order_empty_details.dart';
class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderStatusProvider>(
      builder: (context, status, _) {
        if (status.ordersCompleted.isEmpty) {
          return const OrdersEmptyDetails();
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: status.ordersCompleted.length,
          itemBuilder: (context, index) {
            final order = status.ordersCompleted[index];
            return OrderCard(order: order);
          },
        );
      },
    );
  }
}
