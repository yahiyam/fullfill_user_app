import 'package:flutter/material.dart';

import '../../main.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'History'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          EmptyPageMessege(
            icon: Icons.event_note_outlined,
            mainTitle: 'No history yet',
            subTitle: 'Hit the orange button down\nbelow to Create an order',
          ),
          CommonButton(title: 'Start ordering'),
        ],
      ),
    );
  }
}
