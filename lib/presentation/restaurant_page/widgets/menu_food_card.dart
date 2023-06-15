import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/strings.dart';
import 'package:fullfill_user_app/models/items.dart';
import 'package:fullfill_user_app/presentation/item_page/item_page.dart';

class MenuFoodCard extends StatelessWidget {
  const MenuFoodCard({
    super.key,
    required this.item,
  });
  final Items item;
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
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
              margin: EdgeInsets.only(top: screen.height * .04),
              height: screen.height * .25,
              width: screen.width * .5,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            //top circle
            Container(
              margin: EdgeInsets.only(
                left: screen.width * .075,
              ),
              height: screen.width * .35,
              width: screen.width * .35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item.thumbnailUrl??netImage),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            //food name
            Container(
              margin: EdgeInsets.only(
                left: screen.width * .1,
                top: screen.height * .18,
              ),
              width: screen.width * .3,
              child: Text(
                item.title ?? 'food name',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 19,
                  height: 1,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            //prize tag
            Container(
              margin: EdgeInsets.only(
                left: screen.width * .1,
                top: screen.height * .24,
              ),
              width: screen.width * .3,
              child: Text(
                "${item.price.toString()} $rupee",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1,
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
