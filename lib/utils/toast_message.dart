import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';

class ToastMessage {
  static void show(BuildContext context, String message, [String? image]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(
            image != null
                ? const Duration(milliseconds: 1500)
                : const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        return Dialog(
          backgroundColor: transparent,
          elevation: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (image != null)
                    Image.asset(
                      image,
                      height: 100.0,
                    ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
