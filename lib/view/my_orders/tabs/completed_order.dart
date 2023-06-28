import 'package:flutter/material.dart';
import 'package:fullfill_user_app/view/my_orders/widgets/order_empty_details.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/view/my_orders/widgets/order_card.dart';
import 'package:fullfill_user_app/view_model/my_orders/order_status_provider.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderStatusProvider>(
      builder: (context, status, _) {
        if (status.ordersCompleted.isEmpty) {
          return buildOrdersEmptyDetails(context);
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
