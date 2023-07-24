import 'package:flutter/material.dart';
import '../../../../utils/screen_size.dart';
import '../../../data/models/item.dart';

class ShortInfo extends StatelessWidget {
  const ShortInfo({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Screen.height(31),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Screen.width(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Food's short info".toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              item.shortInfo ?? "Food's short info",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
