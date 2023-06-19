import 'package:flutter/material.dart';

import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/instence.dart';

import 'package:fullfill_user_app/presentation/history_page/history_page.dart';
import 'package:fullfill_user_app/presentation/my_offer_page.dart/my_offer_page.dart';
import 'package:fullfill_user_app/presentation/order_complete_page/order_complete_page.dart';
import 'package:fullfill_user_app/presentation/privacy_page/privacy_page.dart';
import 'package:fullfill_user_app/presentation/profile_page/profile_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: commonColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                CustomDrawerTile(
                  leadingIcon: Icons.account_circle_outlined,
                  title: 'Profile',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ));
                  },
                ),
                const CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.shopping_cart_checkout_rounded,
                  title: 'orders',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrderCompletePage(),
                    ));
                  },
                ),
                const CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.local_offer_outlined,
                  title: 'offer and promo',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyOfferPage(),
                    ));
                  },
                ),
                const CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.sticky_note_2_outlined,
                  title: 'Privacy policy',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrivacyPage(),
                    ));
                  },
                ),
                const CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.history,
                  title: 'History',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HistoryPage(),
                    ));
                  },
                ),
              ],
            ),
            const SizedBox(),
            CustomDrawerTile(
              leadingIcon: Icons.logout_outlined,
              title: 'Sign-out',
              onTap: () {
                firebaseAuth.signOut().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/auth',
                    (route) => false,
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawerTile extends StatelessWidget {
  const CustomDrawerTile({
    super.key,
    this.title,
    this.leadingIcon,
    this.onTap,
  });
  final String? title;
  final IconData? leadingIcon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: commonColor,
      leading: Icon(
        leadingIcon,
        color: white,
      ),
      title: Text(
        title ?? '',
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: white,
        ),
      ),
      onTap: onTap,
    );
  }
}

class CustomDrawerDivider extends StatelessWidget {
  const CustomDrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 56,
      endIndent: 80,
      color: grey300,
    );
  }
}
