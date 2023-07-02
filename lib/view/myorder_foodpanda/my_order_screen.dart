import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/address.dart';
import 'package:fullfill_user_app/data/models/item.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/instence.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:fullfill_user_app/utils/strings.dart';
import 'package:fullfill_user_app/view/home/home_page.dart';
import 'package:fullfill_user_app/view/myorder_foodpanda/oderidquantity.dart';
import 'package:fullfill_user_app/utils/widgets/simple_app_bar.dart';
import 'package:fullfill_user_app/utils/progress_bar.dart';
import 'package:fullfill_user_app/view/my_orders/functions/id_seperating.dart';
import 'package:intl/intl.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: "My Orders"),
      backgroundColor: backgroundColor,
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
                final orderData = orders[index].data() as Map<String, dynamic>;
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
    );
  }
}

class OrderCard extends StatelessWidget {
  final int? itemCount;
  final List<DocumentSnapshot>? data;
  final String? orderID;
  final List<String>? separateQuantitiesList;

  const OrderCard({
    super.key,
    this.itemCount,
    this.data,
    this.orderID,
    this.separateQuantitiesList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 2),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => OrderDetailsScreen(orderID: orderID)));
        },
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

class OrderDetailsScreen extends StatefulWidget {
  final String? orderID;

  const OrderDetailsScreen({super.key, this.orderID});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String orderStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: FutureBuilder<DocumentSnapshot>(
      //     future: FirebaseFirestore.instance
      //         .collection("users")
      //         .doc(sharedPreferences!.getString("uid"))
      //         .collection("orders")
      //         .doc(widget.orderID)
      //         .get(),
      //     builder: (c, snapshot) {
      //       Map? dataMap;
      //       if (snapshot.hasData) {
      //         dataMap = snapshot.data!.data()! as Map<String, dynamic>;
      //         orderStatus = dataMap["status"].toString();
      //       }
      //       return snapshot.hasData
      //           ? Column(
      //               children: [
      //                 StatusBanner(
      //                   status: dataMap!["isSuccess"],
      //                   orderStatus: orderStatus,
      //                 ),
      //                 const SizedBox(
      //                   height: 10.0,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Align(
      //                     alignment: Alignment.centerLeft,
      //                     child: Text(
      //                       "€  ${dataMap["totalAmount"]}",
      //                       style: const TextStyle(
      //                         fontSize: 24,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Text(
      //                     "Order Id = ${widget.orderID!}",
      //                     style: const TextStyle(fontSize: 16),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Text(
      //                     "Order at: ${DateFormat("dd MMMM, yyyy - hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(dataMap["orderTime"])))}",
      //                     style:
      //                         const TextStyle(fontSize: 16, color: Colors.grey),
      //                   ),
      //                 ),
      //                 const Divider(
      //                   thickness: 4,
      //                 ),
      //                 orderStatus == "ended"
      //                     // ? NetworkImage(foodDeliveryImage)
      //                     // : NetworkImage(foodStateImage),
      //                 ? Image.network(foodDeliveryImage)
      //                 : Image.network(foodStateImage),
      //                 const Divider(thickness: 4),
      //                 FutureBuilder<DocumentSnapshot>(
      //                   future: FirebaseFirestore.instance
      //                       .collection("users")
      //                       .doc(sharedPreferences!.getString("uid"))
      //                       .collection("userAddress")
      //                       .doc(dataMap["addressID"])
      //                       .get(),
      //                   builder: (c, snapshot) {
      //                     return snapshot.hasData
      //                         ? ShipmentAddressDesign(
      //                             model: Address.fromJson(snapshot.data!.data()!
      //                                 as Map<String, dynamic>),
      //                           )
      //                         : Center(
      //                             child: circularProgress(),
      //                           );
      //                   },
      //                 ),
      //               ],
      //             )
      //           : Center(
      //               child: circularProgress(),
      //             );
      //     },
      //   ),
      // ),
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection("users")
              .doc(sharedPreferences!.getString("uid"))
              .collection("orders")
              .doc(widget.orderID)
              .get(),
          builder: (c, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: circularProgress());
            } else if (snapshot.hasData) {
              Map<String, dynamic>? dataMap =
                  snapshot.data!.data() as Map<String, dynamic>?;
              if (dataMap != null) {
                orderStatus = dataMap["status"].toString();

                return Column(
                  children: [
                    StatusBanner(
                      status: dataMap["isSuccess"],
                      orderStatus: orderStatus,
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "€ ${dataMap["totalAmount"]}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Order Id = ${widget.orderID!}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Order at: ${DateFormat("dd MMMM, yyyy - hh:mm aa").format(DateTime.fromMillisecondsSinceEpoch(int.parse(dataMap["orderTime"])))}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    const Divider(thickness: 4),
                    orderStatus == "ended"
                        ? Image.network(foodDeliveryImage)
                        : Image.network(foodStateImage),
                    const Divider(thickness: 4),
                    FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection("users")
                          .doc(sharedPreferences!.getString("uid"))
                          .collection("userAddress")
                          .doc(dataMap["addressID"])
                          .get(),
                      builder: (c, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: circularProgress());
                        } else if (snapshot.hasData) {
                          Address model = Address.fromJson(
                              snapshot.data!.data()! as Map<String, dynamic>);

                          return ShipmentAddressDesign(model: model);
                        } else {
                          return Center(child: circularProgress());
                        }
                      },
                    ),
                  ],
                );
              } else {
                return const Center(child: Text("Data not found."));
              }
            } else {
              return Center(child: circularProgress());
            }
          },
        ),
      ),

      // body: Text('saidgn'),
    );
  }
}

class StatusBanner extends StatelessWidget {
  final bool? status;
  final String? orderStatus;

  const StatusBanner({super.key, this.status, this.orderStatus});

  @override
  Widget build(BuildContext context) {
    String? message;
    IconData? iconData;

    status! ? iconData = Icons.done : iconData = Icons.cancel;
    status! ? message = "Successful" : message = "Unsuccessful";

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.cyan,
          Colors.amber,
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      )),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            orderStatus == "ended"
                ? "Parcel Delivered $message"
                : "Order Placed $message",
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.grey,
            child: Center(
              child: Icon(
                iconData,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShipmentAddressDesign extends StatelessWidget {
  final Address? model;

  const ShipmentAddressDesign({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Shipping Details:',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 6.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.name!),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "Phone Number",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.phoneNumber!),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            model!.addressLine??'',
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.cyan,
                    Colors.amber,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                )),
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                child: const Center(
                  child: Text(
                    "Go Back",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
