import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../data/models/seller.dart';
import '../home/widgets/restaurant_card.dart';
class SearchRestaurantPage extends StatefulWidget {
  const SearchRestaurantPage({super.key});

  @override
  State<SearchRestaurantPage> createState() => _SearchRestaurantPageState();
}

class _SearchRestaurantPageState extends State<SearchRestaurantPage> {
  Future<QuerySnapshot>? restaurantsDocumentsList;
  String sellerNameText = "";

  initSearchingRestaurant(String textEntered) {
    restaurantsDocumentsList = FirebaseFirestore.instance
        .collection("sellers")
        .where("sellerName", isGreaterThanOrEqualTo: textEntered)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (textEntered) {
            setState(() {
              sellerNameText = textEntered;
            });
            initSearchingRestaurant(textEntered);
          },
          decoration: InputDecoration(
            hintText: "Search Restaurant here...",
            hintStyle: TextStyle(color: black54),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              color: commonColor,
              onPressed: () {
                initSearchingRestaurant(sellerNameText);
              },
            ),
          ),
          style: const TextStyle(
            color: black,
            fontSize: 16,
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: restaurantsDocumentsList,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Center(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Seller model = Seller.fromJson(snapshot.data!.docs[index]
                          .data()! as Map<String, dynamic>);

                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: RestaurantCard(seller: model),
                      ));
                    },
                  ),
                )
              : const Center(
                  child: Text("No Record Found"),
                );
        },
      ),
    );
  }
}