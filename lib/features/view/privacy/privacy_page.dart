import 'package:flutter/material.dart';
import '../../../utils/widgets/simple_app_bar.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: SimpleAppBar(title: 'Privacy and Policy'),
      body: Center(
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
