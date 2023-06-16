import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/strings.dart';
import 'package:fullfill_user_app/presentation/item_page/widgets/stepper_widget.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool _showMessage = false;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _showMessage = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        height: screen.height / 6.5,
        width: screen.width * .9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Container(
                color: grey300,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screen.height / 4 / 6,
                            width: screen.width / 1.8,
                            child: const Text(
                              "dataljaebgpbepikb",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screen.width / 1.8 / 3 * 2,
                            height: screen.height / 4 / 6,
                            child: const Text(
                              "data",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: screen.width / 1.8 / 3 + 10,
                                height: screen.height / 4 / 6,
                                child: const Text(
                                  "$rupee 50.50",
                                  style: TextStyle(
                                    color: commonColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const StepperWidget(isSmall: true),
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
      ),
    );
  }
}
