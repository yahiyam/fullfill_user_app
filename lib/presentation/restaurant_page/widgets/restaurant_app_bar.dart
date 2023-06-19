import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/utils/cart_icon_button.dart';

class RestaurantAppBar extends StatefulWidget {
  const RestaurantAppBar({
    super.key,
    required this.scrollController,
    required this.sellerUID,
  });

  final ScrollController scrollController;
  final String sellerUID;
  @override
  State<RestaurantAppBar> createState() => _RestaurantAppBarState();
}

class _RestaurantAppBarState extends State<RestaurantAppBar> {
  bool _isScrolledUp = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _isScrolledUp = false;
      });
    } else if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _isScrolledUp = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: _isScrolledUp ? commonColor : backgroundColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline,
            color: _isScrolledUp ? commonColor : backgroundColor,
          ),
        ),
        CartIconButton(
          isScrolledUp: _isScrolledUp,
          sellerUID: widget.sellerUID,
        ),
      ],
    );
  }
}
