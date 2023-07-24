import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/screen_size.dart';
import '../../../../utils/strings.dart';
import '../../../data/models/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, this.order});
  final MyOrder? order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Container(
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
                    color: red,
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
                      const Text(
                        'Restaurant name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text('3 items | 2.4 km'),
                      Row(
                        children: [
                          SizedBox(
                            width: Screen.width(28),
                            height: Screen.height(3),
                            child: const Text(
                              "$rupee'50'",
                              style: TextStyle(
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
      ),
    );
  }
}
