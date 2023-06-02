import 'package:flutter/material.dart';
import 'package:fullfill_user_app/Globals/colors.dart';
import 'package:fullfill_user_app/presentation/HomePage/widgets/heading_title.dart';
import 'package:fullfill_user_app/presentation/common_widgets/common_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: 'My profile'),
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
                        iconBGcolor: orange,
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

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard({
    super.key,
    required this.type,
    required this.icon,
    this.iconBGcolor,
    this.isSelected = false,
  });
  final String type;
  final IconData icon;
  final Color? iconBGcolor;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        type,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: iconBGcolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      trailing: isSelected!
          ? const Icon(
              Icons.adjust_rounded,
              color: orange,
            )
          : const Icon(
              Icons.fiber_manual_record_outlined,
              color: grey,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[400],
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/malePerson.png'),
                    ),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sample person',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'sample@gmail.com',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    Text(
                      'sample address, behind  campus',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: grey,
                      ),
                    ),
                    SizedBox(),
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
