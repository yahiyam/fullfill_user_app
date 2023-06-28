import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/view/cart/functions/assistant_methods.dart';
import 'package:fullfill_user_app/view/cart/widgets/cart_app_bar.dart';
import 'package:fullfill_user_app/view/cart/widgets/cart_items.dart';
import 'package:fullfill_user_app/view/cart/widgets/cart_summery.dart';

class CartPage extends StatelessWidget {
  final String sellerUID;

  const CartPage({
    super.key,
    required this.sellerUID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppBar(context),
      body: CustomScrollView(
        slivers: [
          buildCartItems(),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("items")
                .where("itemID", whereIn: separateItemIDs())
                .orderBy("publishedDate", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              return buildCartSummary(snapshot.data, sellerUID);
            },
          ),
        ],
      ),
    );
  }
}
