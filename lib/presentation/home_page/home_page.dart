import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fullfill_user_app/data/models/sellers.dart';

import 'package:fullfill_user_app/globals/instence.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/globals/text_style.dart';

import 'package:fullfill_user_app/presentation/home_page/functions/meal_categories.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/custom_drawer.dart';
import 'package:fullfill_user_app/presentation/home_page/widgets/restaurant_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: [
          _buildHeader(),
          _buildRestaurantsSection(),
          _buildRestaurantList(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          SizedBox(
            width: Screen.width() * .4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.place_outlined,
                  color: commonColor,
                ),
                Text(
                  'Location',
                  style: CommonUtils.getTextStyle(fontSize: 18),
                ),
                const Icon(
                  Icons.expand_more_rounded,
                  color: commonColor,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader() {
    final String currentCategory = getMealCategory();
    final String userName = sharedPreferences!.getString("name")!.toUpperCase();

    return SliverToBoxAdapter(
      child: SizedBox(
        height: Screen.height() / 4.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildWelcomeMessage(userName, currentCategory),
            const SizedBox(height: 20),
            _buildSearchTextField(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage(String userName, String currentCategory) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: CommonUtils.getTextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: black,
        ),
        children: [
          const TextSpan(text: 'Welcome '),
          TextSpan(
            text: userName,
            style: CommonUtils.getTextStyle(color: commonColor),
          ),
          TextSpan(
            text: '.\nWhat do you want for ',
            style: CommonUtils.getTextStyle(color: black),
          ),
          TextSpan(
            text: currentCategory,
            style: CommonUtils.getTextStyle(
              height: 1.5,
              color: commonColor,
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Icon(Icons.search_rounded),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          filled: true,
          fillColor: searchBGC,
          hintText: 'Search',
          hintStyle: CommonUtils.getTextStyle(
            fontSize: 18,
            color: grey,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRestaurantsSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: Screen.width() * .05,
          top: Screen.width() * .05,
        ),
        child: Text(
          'Restaurants',
          textAlign: TextAlign.left,
          style: CommonUtils.getTextStyle(fontSize: 18),
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot> _buildRestaurantList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("sellers").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      commonColor,
                    ),
                  ),
                )),
              ],
            ),
          );
        }

        final List<Sellers> sellersList = snapshot.data!.docs
            .map((doc) => Sellers.fromJson(doc.data() as Map<String, dynamic>))
            .toList();

        if (sellersList.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('No restaurants available'),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final Sellers seller = sellersList[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Screen.width() * .05,
                  vertical: Screen.width() * .03,
                ),
                child: RestaurantCard(seller: seller),
              );
            },
            childCount: sellersList.length,
          ),
        );
      },
    );
  }
}
