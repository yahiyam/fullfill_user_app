import 'package:flutter/material.dart';
import 'package:user_app/features/view/settings/settings_page.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/alert_message.dart';
import '../../../../utils/instence.dart';
import '../../history/history_page.dart';
import '../../my_offers/my_offer_page.dart';
import '../../myorder_foodpanda/my_order_screen.dart';
import '../../profile/profile_page.dart';
import '../home_page.dart';
class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

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
            const Wrap(
              children: [
                CustomDrawerTile(
                  leadingIcon: Icons.account_circle_outlined,
                  title: 'Profile',
                  navigate: ProfilePage(),
                ),
                CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.shopping_cart_checkout_rounded,
                  title: 'My orders',
                  navigate: MyOrdersScreen(),
                ),
                CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.local_offer_outlined,
                  title: 'offer and promo',
                  navigate: MyOfferPage(),
                ),
                CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.history,
                  title: 'History',
                  navigate: HistoryPage(),
                ),
                CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.settings,
                  title: 'Settings',
                  navigate: SettingsPage(),
                ),
              ],
            ),
            const SizedBox(),
            CustomDrawerTile(
              leadingIcon: Icons.logout_outlined,
              title: 'Logout',
              onTap: () {
                showAlertMessege(
                  context,
                  message: 'Do you really want to Logout',
                  onOKTap: () {
                    firebaseAuth.signOut().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/auth',
                        (route) => false,
                      );
                    });
                  },
                );
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
    this.navigate,
  });
  final String? title;
  final IconData? leadingIcon;
  final VoidCallback? onTap;
  final Widget? navigate;
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
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => navigate ?? const HomePage(),
          ),
        );
        onTap;
      },
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
