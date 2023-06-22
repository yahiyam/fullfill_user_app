import 'package:flutter/material.dart';

import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/screen_size.dart';
import 'package:fullfill_user_app/global/strings.dart';

import 'package:fullfill_user_app/data/models/items.dart';

import 'package:fullfill_user_app/view/item_page/item_page.dart';

class MenuFoodCard extends StatelessWidget {
  const MenuFoodCard({
    super.key,
    required this.item,
  });
  final Items item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemPage(item: item),
          ));
        },
        child: Stack(
          children: [
            //bg white
            Container(
              margin: EdgeInsets.only(top: Screen.height(4)),
              height: Screen.height(25),
              width: Screen.width(50),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            //top circle
            Container(
              margin: EdgeInsets.only(left: Screen.width(7.5)),
              height: Screen.width(35),
              width: Screen.width(35),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item.thumbnailUrl ?? netImage),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            //food name
            Container(
              margin: EdgeInsets.only(
                left: Screen.width(10),
                top: Screen.height(18),
              ),
              width: Screen.width(30),
              alignment: Alignment.topCenter,
              child: Text(
                item.title ?? 'food name',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 19,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            //prize tag
            Container(
              margin: EdgeInsets.only(
                left: Screen.width(10),
                top: Screen.height(25),
              ),
              width: Screen.width(30),
              child: Text(
                "${item.price.toString()} $rupee",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: commonColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
