import 'package:flutter/material.dart';
import 'package:fullfill_user_app/global/colors.dart';
import 'package:fullfill_user_app/global/instence.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:fullfill_user_app/utils/heading_title.dart';
import 'package:fullfill_user_app/utils/common_widgets.dart';
import 'package:fullfill_user_app/view/payment_page/widgets/payment_type_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
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
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PaymentTypeCard(
                        icon: Icons.payment,
                        type: 'Card',
                        isSelected: true,
                        iconBGcolor: commonColor,
                      ),
                      PaymentTypeCard(
                        icon: Icons.account_balance_rounded,
                        type: 'UPI',
                        iconBGcolor: Colors.pinkAccent,
                      ),
                      PaymentTypeCard(
                        icon: Icons.payments_outlined,
                        type: 'Pay on delivery',
                        iconBGcolor: Colors.blueAccent,
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
