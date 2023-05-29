import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';

class ConnectionErrorPage extends StatelessWidget {
  const ConnectionErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EmptyPageMessege(
            icon: Icons.wifi_off_rounded,
            mainTitle: 'No internet Connection',
            subTitle: 'Your internet connection is currently\nnot available please check or try again.',
          ),
          CommonButton(title: 'Try again'),
        ],
      ),
    );
  }
}