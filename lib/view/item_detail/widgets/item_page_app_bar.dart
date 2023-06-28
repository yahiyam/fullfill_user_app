import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/item.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/widgets/cart_counter_badge.dart';
import 'package:fullfill_user_app/view/cart/cart_page.dart';

// AppBar buildItemAppBar(BuildContext context, ) {
//   return ;
// }
class ItemAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ItemAppBar({super.key, required this.item});
  final Item item;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(sellerUID: item.sellerUID!),
              )),
            ),
            const CartIconWithBadge(),
          ],
        ),
      ],
    );
  }
}
