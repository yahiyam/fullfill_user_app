import 'package:flutter/material.dart';
import 'package:fullfill_user_app/Globals/colors.dart';

Future<dynamic> showMessageDialog(
  BuildContext context, {
  required String message,
  bool isLoading = false,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      if (isLoading) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 12),
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    orange,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('$message, Please wait...'),
            ],
          ),
        );
      } else {
        return AlertDialog(
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: orange,
              ),
              child: const Center(
                child: Text(
                  'OK',
                  style: TextStyle(color: white),
                ),
              ),
            ),
          ],
        );
      }
    },
  );
}
