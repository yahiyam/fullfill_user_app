import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RestaurantAppBar extends StatefulWidget {
  const RestaurantAppBar({
    super.key,
    required this.scaffoldKey,
    required this.scrollController,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final ScrollController scrollController;

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: _isScrolledUp ? Colors.black : Colors.white,
          ),
        ),
      ],
    );
  }
}
