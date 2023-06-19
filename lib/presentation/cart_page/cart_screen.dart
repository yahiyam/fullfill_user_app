// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fullfill_user_app/assistent_methods/assistant_methods.dart';
// import 'package:fullfill_user_app/models/items.dart';
// import 'package:fullfill_user_app/presentation/cart_page/widgets/cart_card.dart';
// import 'package:fullfill_user_app/presentation/home_page/home_page.dart';
// import 'package:fullfill_user_app/presentation/widgets/toast_message.dart';
// import 'package:fullfill_user_app/provider/cart_item_counter_provider.dart';
// import 'package:fullfill_user_app/provider/total_amount.dart';
// import 'package:provider/provider.dart';

// import '../../assistent_methods/progress_bar.dart';

// class CartScreen extends StatefulWidget {
//   final String? sellerUID;

//   const CartScreen({super.key, this.sellerUID});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   List<int>? separateItemQuantityList;
//   num totalAmount = 0;

//   @override
//   void initState() {
//     super.initState();

//     totalAmount = 0;
//     Provider.of<TotalAmount>(context, listen: false).displayTotalAmount(0);

//     separateItemQuantityList = separateItemQuantities();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//             colors: [
//               Colors.cyan,
//               Colors.amber,
//             ],
//             begin: FractionalOffset(0.0, 0.0),
//             end: FractionalOffset(1.0, 0.0),
//             stops: [0.0, 1.0],
//             tileMode: TileMode.clamp,
//           )),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.clear_all),
//           onPressed: () {
//             clearCartNow(context);
//           },
//         ),
//         title: const Text(
//           "iFood",
//           style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         actions: [
//           Stack(
//             children: [
//               IconButton(
//                 icon: const Icon(
//                   Icons.shopping_cart,
//                   color: Colors.cyan,
//                 ),
//                 onPressed: () {
//                   print("clicked");
//                 },
//               ),
//               Positioned(
//                 child: Stack(
//                   children: [
//                     const Icon(
//                       Icons.brightness_1,
//                       size: 20.0,
//                       color: Colors.green,
//                     ),
//                     Positioned(
//                       top: 3,
//                       right: 4,
//                       child: Center(
//                         child: Consumer<CartItemCounter>(
//                           builder: (context, counter, c) {
//                             return Text(
//                               counter.count.toString(),
//                               style: const TextStyle(
//                                   color: Colors.white, fontSize: 12),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const SizedBox(
//             width: 10,
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: FloatingActionButton.extended(
//               label: const Text(
//                 "Clear Cart",
//                 style: TextStyle(fontSize: 16),
//               ),
//               backgroundColor: Colors.cyan,
//               icon: const Icon(Icons.clear_all),
//               onPressed: () {
//                 clearCartNow(context);

//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (c) => const HomePage()));
//                 ToastMessage.show(context, "Cart has been cleared.");
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: FloatingActionButton.extended(
//               label: const Text(
//                 "Check Out",
//                 style: TextStyle(fontSize: 16),
//               ),
//               backgroundColor: Colors.cyan,
//               icon: const Icon(Icons.navigate_next),
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (c) => AddressScreen(
//                 //       totalAmount: totalAmount.toDouble(),
//                 //       sellerUID: widget.sellerUID,
//                 //     ),
//                 //   ),
//                 // );
//               },
//             ),
//           ),
//         ],
//       ),
//       body: CustomScrollView(
//         slivers: [
//           //overall total amount
//           // SliverPersistentHeader(
//           //     pinned: true, delegate: TextWidgetHeader(title: "My Cart List")),

//           SliverToBoxAdapter(
//             child: Consumer2<TotalAmount, CartItemCounter>(
//                 builder: (context, amountProvider, cartProvider, c) {
//               return Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Center(
//                   child: cartProvider.count == 0
//                       ? Container()
//                       : Text(
//                           "Total Price: ${amountProvider.tAmount}",
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                 ),
//               );
//             }),
//           ),

//           //display cart items with quantity number
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection("items")
//                 .where("itemID", whereIn: separateItemIDs())
//                 .orderBy("publishedDate", descending: true)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               return !snapshot.hasData
//                   ? SliverToBoxAdapter(
//                       child: Center(
//                         child: circularProgress(),
//                       ),
//                     )
//                   : snapshot.data!.docs.isEmpty
//                       ? //startBuildingCart()
//                       Container()
//                       : SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             (context, index) {
//                               Items model = Items.fromJson(
//                                 snapshot.data!.docs[index].data()!
//                                     as Map<String, dynamic>,
//                               );

//                               if (index == 0) {
//                                 totalAmount = 0;
//                                 totalAmount = totalAmount +
//                                     (model.price! *
//                                         separateItemQuantityList![index]);
//                               } else {
//                                 totalAmount = totalAmount +
//                                     (model.price! *
//                                         separateItemQuantityList![index]);
//                               }

//                               if (snapshot.data!.docs.length - 1 == index) {
//                                 WidgetsBinding.instance
//                                     .addPostFrameCallback((timeStamp) {
//                                   Provider.of<TotalAmount>(context,
//                                           listen: false)
//                                       .displayTotalAmount(
//                                           totalAmount.toDouble());
//                                 });
//                               }

//                               return CartCard(
//                                 item: model,
//                                 quanNumber: separateItemQuantityList![index],
//                               );
//                             },
//                             childCount: snapshot.hasData
//                                 ? snapshot.data!.docs.length
//                                 : 0,
//                           ),
//                         );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
