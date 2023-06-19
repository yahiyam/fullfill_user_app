import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/strings.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/presentation/cart_page/widgets/cart_card.dart';
import 'package:fullfill_user_app/utils/common_widgets.dart';
import 'package:fullfill_user_app/utils/progress_bar.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.sellerUID});
  final String sellerUID;

  @override
  Widget build(BuildContext context) {
    List<int>? separateItemQuantityList = separateItemQuantities();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Cart',
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
                return !snapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: circularProgress(),
                        ),
                      )
                    : snapshot.data!.docs.isEmpty
                        ? //startBuildingCart()
                        Container()
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              Items model = Items.fromJson(
                                snapshot.data!.docs[index].data()!
                                    as Map<String, dynamic>,
                              );
                              return CartCard(
                                item: model,
                                quanNumber: separateItemQuantityList![index],
                              );
                            },
                            childCount: snapshot.hasData
                                ? snapshot.data!.docs.length
                                : 0,
                          ));
              },
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const CartPriceContainer();
              },
              childCount: 1,
            )),
          ],
        ),
      ),
    );
  }
}

class CartPriceContainer extends StatelessWidget {
  const CartPriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Container(
      height: screen.height / 2.42,
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
            height: screen.height / 3 / 1.7 / 3,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: grey300,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 0),
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
            height: screen.height / 3 / 1.7,
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
                        '$rupee 10.25',
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
                        '$rupee 25',
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
                        '$rupee 0.25',
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
                        '% 8',
                        style: TextStyle(
                          color: black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  }
}
