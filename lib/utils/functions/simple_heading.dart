import 'package:flutter/material.dart';

Text buildSimpleHeading(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
}
