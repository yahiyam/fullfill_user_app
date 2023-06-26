import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/functions/simple_app_bar.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildSimpleAppBar(context,title: 'Privacy and Policy'),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sentiment_dissatisfied,
              size: 300,
            ),
            Text(
              'Nothing here',
              style: TextStyle(
                fontSize: 50,
                wordSpacing: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
