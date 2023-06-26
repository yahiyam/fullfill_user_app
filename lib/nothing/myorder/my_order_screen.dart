import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/item.dart';
import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/instence.dart';
import 'package:fullfill_user_app/global/screen_size.dart';
import 'package:fullfill_user_app/global/strings.dart';
import 'package:fullfill_user_app/nothing/myorder/oderidquantity.dart';
import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';
import 'package:fullfill_user_app/utils/progress_bar.dart';
import 'package:fullfill_user_app/view/my_order_page/functions/id_seperating.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildSimpleAppBar(context, title: "My Orders"),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(sharedPreferences!.getString("uid"))
              .collection("orders")
              .where("status", isEqualTo: "normal")
              .orderBy("orderTime", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final orders = snapshot.data!.docs;
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final orderData =
                      orders[index].data() as Map<String, dynamic>;
                  final productIDs = orderData["productIDs"];

                  return FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection("items")
                        .where("itemID",
                            whereIn: separateOrderItemIDs(productIDs))
                        .where("orderBy", whereIn: orderData["uid"])
                        .orderBy("publishedDate", descending: true)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final itemDocs = snapshot.data!.docs;
                        final itemCount = itemDocs.length;
                        final quantitiesList =
                            separateOrderItemQuantities(productIDs);

                        return OrderCard(
                          itemCount: itemCount,
                          data: itemDocs,
                          separateQuantitiesList: quantitiesList,
                        );
                      } else {
                        return Center(child: circularProgress());
                      }
                    },
                  );
                },
              );
            } else {
              return Center(child: circularProgress());
            }
          },
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final int? itemCount;
  final List<DocumentSnapshot>? data;
  final List<String>? separateQuantitiesList;

  const OrderCard({
    super.key,
    this.itemCount,
    this.data,
    this.separateQuantitiesList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 2),
      child: SizedBox(
        height: itemCount! * Screen.height(18),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            Item model =
                Item.fromJson(data![index].data()! as Map<String, dynamic>);
            return orderCardDesign(
              model,
              context,
              separateQuantitiesList![index],
            );
          },
        ),
      ),
    );
  }

  Widget orderCardDesign(
    Item model,
    BuildContext context,
    String separateQuantitiesList,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: Screen.height(17),
      width: Screen.width(90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: grey300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: Screen.height(1)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //image
              Container(
                height: Screen.height(10),
                width: Screen.width(22.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(model.thumbnailUrl!),
                  ),
                ),
              ),
              Container(
                height: Screen.height(10),
                width: Screen.width(49),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('$separateQuantitiesList items | 2.4 km'),
                    Row(
                      children: [
                        SizedBox(
                          width: Screen.width(28),
                          height: Screen.height(3),
                          child: Text(
                            "$rupee ${model.price.toString()}",
                            style: const TextStyle(
                              color: commonColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: Screen.width(13),
                          height: Screen.height(3),
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Paid',
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel order'),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: Screen.height(3),
                  width: Screen.width(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: red,
                  ),
                  child: const Center(
                    child: Text(
                      'Order details',
                      style: TextStyle(color: white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
