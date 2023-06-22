import 'package:flutter/material.dart';
import 'package:fullfill_user_app/global/colors.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        commonColor,
      ),
    ),
  );
}
