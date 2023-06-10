import 'package:flutter/material.dart';

class RestaurantFlexibleSpaceBar extends StatelessWidget {
  RestaurantFlexibleSpaceBar({super.key});
  final double appBarHeight = 66.0;
  final FocusNode _textFieldFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return FlexibleSpaceBar(
      background: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + appBarHeight,
        decoration: const BoxDecoration(
          color: Color(0xfffa4a0c),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: screen.height / 3.5 / 2,
                    width: screen.width / 5 * 3,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Khaja Restaurant',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w400,
                          height: 1.2025,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Chip(label: Text('free')),
                      Chip(label: Text('4.8')),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  focusNode: _textFieldFocus,
                  textInputAction:
                      TextInputAction.done, // Specify the desired action
                  onSubmitted: (_) {
                    _textFieldFocus
                        .unfocus(); // Dismiss the keyboard when the action is performed
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Icon(Icons.search_rounded),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    filled: true,
                    fillColor: const Color(0xFFEFEEEE),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
