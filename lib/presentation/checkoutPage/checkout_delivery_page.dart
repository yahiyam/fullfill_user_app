import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/checkoutPage/widgets/delivery_type_card.dart';
import 'package:fullfill_user_app/presentation/commonWidgets/common_widgets.dart';

import '../../globals/colors.dart';
import '../homePage/widgets/heading_title.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      backgroundColor: grey200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              'Delivery',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w400,
                height: 1.2025,
                color: black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadingTitle(
                      title: 'Address details',
                      padding: false,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'change',
                        style: TextStyle(
                          color: commonColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: screen.height / 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thelma Sara-bear',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.2025,
                            color: black,
                          ),
                        ),
                        Text(
                          'Trasaco hotel, behind navrongo campus',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            height: 1.2025,
                            color: black,
                          ),
                        ),
                        Text(
                          '+233 5413 8989',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.2025,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingTitle(
                  title: 'Delivery Method',
                  padding: false,
                ),
                const SizedBox(height: 12),
                Container(
                  height: screen.height / 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DeliveryTypeCard(
                        type: 'Door delivery',
                        isSelected: true,
                      ),
                      DeliveryTypeCard(
                        type: 'Pick up',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CommonButton(
            title: 'Proceed to payment',
            onTap: () {
              Navigator.pushNamed(context, '/payment');
            },
          ),
        ],
      ),
    );
  }
}