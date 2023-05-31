import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Color(0xfffa4a0c),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                CustomDrawerTile(
                  leadingIcon: Icons.account_circle_outlined,
                  title: 'Profile',
                ),
                CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.shopping_cart_checkout_rounded,
                  title: 'orders',
                ),
                CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.local_offer_outlined,
                  title: 'offer and promo',
                ),
                CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.sticky_note_2_outlined,
                  title: 'Privacy policy',
                ),
                CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.history,
                  title: 'History',
                ),
              ],
            ),
            SizedBox(),
            CustomDrawerTile(
              leadingIcon: Icons.logout_outlined,
              title: 'Sign-out',
            )
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
  });
  final String? title;
  final IconData? leadingIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: Colors.white,
      ),
      title: Text(
        title ?? '',
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: Color(0xffffffff),
        ),
      ),
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
      color: Colors.grey[350],
    );
  }
}
