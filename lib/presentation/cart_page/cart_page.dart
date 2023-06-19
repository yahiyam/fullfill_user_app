import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/globals/strings.dart';
import 'package:fullfill_user_app/presentation/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/presentation/cart_page/widgets/cart_card.dart';
import 'package:fullfill_user_app/utils/common_widgets.dart';
import 'package:fullfill_user_app/utils/progress_bar.dart';

class CartPage extends StatelessWidget {
  final String sellerUID;

  const CartPage({
    super.key,
    required this.sellerUID,
  });

  @override
  Widget build(BuildContext context) {
    List<int>? separateItemQuantityList = separateItemQuantities();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: Screen.height(10),
        centerTitle: true,
        backgroundColor: transparent,
        leading: IconButton(
          padding: EdgeInsets.only(left: Screen.width(4)),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: Screen.height(2.2),
          ),
        ),
        title: const Text(
          'Cart',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              clearCartNow(context);
            },
            icon: const Icon(Icons.clear_all),
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          clearCartNow(context);
          return true;
        },
        child: CustomScrollView(
          slivers: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("items")
                  .where("itemID", whereIn: separateItemIDs())
                  .orderBy("publishedDate", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: circularProgress(),
                    ),
                  );
                } else {
                  if (snapshot.data!.docs.isEmpty) {
                    return SliverToBoxAdapter(child: Container());
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          Items model = Items.fromJson(
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>,
                          );
                          return CartCard(
                            item: model,
                            quanNumber: separateItemQuantityList![index],
                          );
                        },
                        childCount:
                            snapshot.hasData ? snapshot.data!.docs.length : 1,
                      ),
                    );
                  }
                }
              },
            ),
            SliverList(
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
                        Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: TextStyle(
                                        color: black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$rupee 10.25',
                                      style: TextStyle(
                                        color: black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery fee',
                                      style: TextStyle(
                                        color: black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$rupee 25',
                                      style: TextStyle(
                                        color: black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Discount',
                                      style: TextStyle(
                                        color: black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$rupee 0.25',
                                      style: TextStyle(
                                        color: black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tax',
                                      style: TextStyle(
                                        color: black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '% 8',
                                      style: TextStyle(
                                        color: black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '$rupee 38.34',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        CommonButton(
                          title: 'Proceed Order',
                          onTap: () {},
                        ),
                        const SizedBox(),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
