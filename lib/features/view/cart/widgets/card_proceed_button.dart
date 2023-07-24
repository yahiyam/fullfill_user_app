import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_app/features/view/cart/functions/assistant_methods.dart';
import 'package:user_app/features/view/list_address/address_page.dart';
import 'package:user_app/utils/common_button.dart';

class CartProceedButton extends StatelessWidget {
  const CartProceedButton({
    super.key,
    required this.sellerUID,
  });
  final String sellerUID;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("items")
          .where("itemID", whereIn: separateItemIDs())
          .orderBy("publishedDate", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return SliverList(
            delegate: SliverChildListDelegate([
              CommonButton(
                title: ' Go to Restaurant Page',
                onTap: () => Navigator.of(context).pop(),
              ),
            ]),
          );
        }
        return SliverList(
          delegate: SliverChildListDelegate([
            CommonButton(
              title: 'Proceed Order',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddressPage(sellerUID: sellerUID),
                ));
              },
            ),
          ]),
        );
      },
    );
  }
}
