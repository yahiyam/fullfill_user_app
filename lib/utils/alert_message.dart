import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';

Future<dynamic> showAlertMessege(
  BuildContext context, {
  required String message,
  String? title,
  Function? onOKTap,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title ?? 'Alert Message'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Text(
                'Cancel',
                style: TextStyle(color: grey),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (onOKTap != null) {
                onOKTap();
              }
            },
            child: const Center(
              child: Text(
                'Continue',
                style: TextStyle(color: commonColor),
              ),
            ),
          ),
        ],
      );
    },
  );
}
