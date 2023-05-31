import 'package:flutter/material.dart';

class HeadingTitle extends StatelessWidget {
  const HeadingTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: screen.width * .05,
        top: screen.width * .05,
      ),
      child:  Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}