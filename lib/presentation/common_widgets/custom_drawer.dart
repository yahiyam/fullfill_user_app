import 'package:flutter/material.dart';
import 'package:fullfill_user_app/Globals/instence.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xfffa4a0c),
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
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                const CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.shopping_cart_checkout_rounded,
                  title: 'orders',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/order');
                  },
                ),
                const CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.local_offer_outlined,
                  title: 'offer and promo',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/myOffer');
                  },
                ),
                const CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.sticky_note_2_outlined,
                  title: 'Privacy policy',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/privacy');
                  },
                ),
                const CustomDrawerDivider(),
                CustomDrawerTile(
                  leadingIcon: Icons.history,
                  title: 'History',
                  onTap: () {
                    Navigator.pop(context);
                    if (ModalRoute.of(context)!.settings.name != '/home') {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    }
                    Navigator.pushNamed(context, '/history');
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
      color: Colors.grey[350],
    );
  }
}
