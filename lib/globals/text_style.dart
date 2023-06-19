import 'package:flutter/material.dart';

class CommonUtils {
  static TextStyle getTextStyle({
    double? height,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
