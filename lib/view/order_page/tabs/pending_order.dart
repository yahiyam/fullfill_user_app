import 'package:flutter/material.dart';
import 'package:fullfill_user_app/view/order_page/provider/order_status_provider.dart';
import 'package:fullfill_user_app/view/order_page/widgets/order_card.dart';
import 'package:fullfill_user_app/view/order_page/widgets/order_empty_details.dart';
import 'package:provider/provider.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderStatusProvider>(
      builder: (context, status, _) {
        if (status.ordersPending.isEmpty) {
          return buildOrdersEmptyDetails(context);
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: status.ordersPending.length,
          itemBuilder: (context, index) {
            final order = status.ordersPending[index];
            return OrderCard(order: order);
          },
        );
      },
    );
  }
}
