import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/strings.dart';

import '../../../data/models/items.dart';

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
    final Size screen = MediaQuery.of(context).size;
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _showMessage = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
        height: screen.height * .9 / 6.5,
        width: screen.width * .9 * .9,
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
                          height: screen.height * .9 / 4 / 6,
                          width: screen.width * .9 / 1.8,
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
                          width: screen.width * .9 / 1.8 / 3 * 2,
                          height: screen.height * .9 / 4 / 6,
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
                              width: screen.width * .9 / 1.8 / 3 + 25,
                              height: screen.height * .9 / 4 / 6,
                              child: Text(
                                "$rupee${widget.item?.price ?? 0} x ${widget.quanNumber.toString()}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: screen.width * .9 / 1.8 / 3 +
                                  screen.width * .9 / 1.8 / 4 +
                                  5,
                              height: screen.height * .9 / 4 / 6,
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
                            // const StepperWidget(isSmall: true),
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
                        style: TextStyle(
                          color: grey200,
                        ),
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
