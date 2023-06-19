import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/globals/strings.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    super.key,
    this.item,
    this.quanNumber,
  });
  final Items? item;
  final int? quanNumber;
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool _showMessage = false;
  @override
  Widget build(BuildContext context) {
    int? price = (widget.item?.price ?? 1) * (widget.quanNumber ?? 1);
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _showMessage = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
        height: Screen.height(13.84),
        width: Screen.width(81),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: grey300,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        widget.item?.thumbnailUrl ?? netFoodImage,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Screen.height(3.75),
                          width: Screen.width(50),
                          child: Text(
                            widget.item?.title ?? 'Item title',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Screen.width(33.13),
                          height: Screen.height(3.75),
                          child: Text(
                            widget.item?.shortInfo ?? "Items Short info",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: Screen.width(23.02),
                              height: Screen.height(3.75),
                              child: Text(
                                "$rupee${widget.item?.price ?? 0} x ${widget.quanNumber.toString()}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: Screen.width(30.43),
                              height: Screen.height(3.75),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "$rupee$price",
                                style: const TextStyle(
                                  color: commonColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (_showMessage)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Remove this item?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'you will loose this item from cart!!!',
                        style: TextStyle(color: grey200),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _showMessage = false;
                              });
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform your Remove operation here

                              setState(() {
                                _showMessage = false;
                              });
                            },
                            child: const Text(
                              'Remove',
                              style: TextStyle(
                                color: danger,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
