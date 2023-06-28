import 'package:flutter/material.dart';

// Text SimpleHeading(String title) {
//   return Text(
//     title,
//     style: const TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 20,
//     ),
//   );
// }

class SimpleHeading extends StatelessWidget {
  const SimpleHeading({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
