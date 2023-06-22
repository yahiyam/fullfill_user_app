import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/view/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/view/cart_page/providers/total_amount.dart';
import 'package:fullfill_user_app/view/cart_page/widgets/cart_card.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';
import 'package:fullfill_user_app/utils/progress_bar.dart';
import 'package:provider/provider.dart';

StreamBuilder<QuerySnapshot<Object?>> buildCartItems() {
  List<int>? separateItemQuantityList = separateItemQuantities();
  num totalAmount = 0;

  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection("items")
        .where("itemID", whereIn: separateItemIDs())
        .orderBy("publishedDate", descending: true)
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return SliverToBoxAdapter(
          child: Center(child: Text('Error: ${snapshot.error}')),
        );
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return SliverToBoxAdapter(
          child: Center(child: circularProgress()),
        );
      }

      if (snapshot.data!.docs.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            heightFactor: 2,
            child: EmptyPageMessege(
              icon: Icons.sentiment_neutral_rounded,
              mainTitle: 'No items available!',
              subTitle: "Add from restaurant page and checkout.",
            ),
          ),
        );
      }

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            Items model = Items.fromJson(
              snapshot.data!.docs[index].data() as Map<String, dynamic>,
            );

            if (index == 0) {
              totalAmount = 0;
              totalAmount = totalAmount +
                  (model.price! * separateItemQuantityList![index]);
            } else {
              totalAmount = totalAmount +
                  (model.price! * separateItemQuantityList![index]);
            }

            if (snapshot.data!.docs.length - 1 == index) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Provider.of<TotalAmount>(context, listen: false)
                    .displayTotalAmount(totalAmount.toDouble());
              });
            }

            return CartCard(
              item: model,
              quanNumber: separateItemQuantityList[index],
            );
          },
          childCount: snapshot.hasData ? snapshot.data!.docs.length : 1,
        ),
      );
    },
  );
}
