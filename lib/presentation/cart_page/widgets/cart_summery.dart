import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/globals/strings.dart';
import 'package:fullfill_user_app/presentation/address_page/address_page.dart';
import 'package:fullfill_user_app/presentation/cart_page/providers/total_amount.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:provider/provider.dart';

SliverList buildCartSummary(
    QuerySnapshot<Object?>? snapshot, String sellerUID) {
  // late double grandTotal;
  if (snapshot == null || snapshot.docs.isEmpty) {
    return SliverList(
      delegate: SliverChildListDelegate([]),
    );
  }
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          height: Screen.height(41),
          decoration: BoxDecoration(
            color: backgroundColor?.withAlpha(200),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Screen.height(6.5),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: grey300,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(),
                    const Icon(
                      Icons.discount,
                      color: commonColor,
                    ),
                    const Text(
                      'Add Promo code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 50),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: commonColor,
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<TotalAmount>(builder: (context, amountProvider, _) {
                return Container(
                  height: Screen.height(19.6),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: grey300,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                color: black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$rupee ${amountProvider.totalAmount}',
                              style: TextStyle(
                                color: black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery fee',
                              style: TextStyle(
                                color: black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$rupee ${amountProvider.deliveryCharge}',
                              style: TextStyle(
                                color: black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: TextStyle(
                                color: black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$rupee ${amountProvider.discountAmount}',
                              style: TextStyle(
                                color: black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax',
                              style: TextStyle(
                                color: black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '% ${amountProvider.discountPercentage}',
                              style: TextStyle(
                                color: black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$rupee ${amountProvider.grandTotal}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
              CommonButton(
                title: 'Proceed Order',
                onTap: () {
                  double grandTotal =
                      Provider.of<TotalAmount>(context,listen: false).totalAmount;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddressPage(
                      totalAmount: grandTotal,
                      sellerUID: sellerUID,
                    ),
                  ));
                },
              ),
              const SizedBox(),
            ],
          ),
        );
      },
      childCount: 1,
    ),
  );
}
