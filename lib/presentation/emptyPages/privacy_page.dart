import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/commonWidgets/common_widgets.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
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
