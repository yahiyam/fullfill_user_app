import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../utils/common_button.dart';
import '../../../utils/heading_title.dart';
import '../../../utils/instence.dart';
import '../../../utils/widgets/simple_app_bar.dart';
import '../payment/widgets/payment_type_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SimpleAppBar(
        title: 'Welcome ${sharedPreferences!.getString("name")!}',
      ),
      backgroundColor: grey200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PersonCard(screen: screen),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingTitle(
                  title: 'Payment Method',
                  padding: false,
                ),
                const SizedBox(height: 12),
                Container(
                  height: screen.height / 7 * 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PaymentTypeCard(
                        icon: Icons.payment,
                        type: 'Card',
                        iconBGcolor: commonColor,
                        isSelected: false,
                        onTap: () {},
                      ),
                      PaymentTypeCard(
                        icon: Icons.account_balance_rounded,
                        type: 'UPI',
                        iconBGcolor: Colors.pinkAccent,
                        isSelected: false,
                        onTap: () {},
                      ),
                      PaymentTypeCard(
                        icon: Icons.payments_outlined,
                        type: 'Pay on delivery',
                        iconBGcolor: Colors.blueAccent,
                        isSelected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(),
          const CommonButton(title: 'Update Information'),
        ],
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingTitle(
            title: 'Information',
            padding: false,
          ),
          const SizedBox(height: 12),
          Container(
            height: screen.height / 7,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[400],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        sharedPreferences!.getString("photoUrl")!,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sharedPreferences!.getString("name")!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      sharedPreferences!.getString("email")!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    const Text(
                      'sample address, behind  campus',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
