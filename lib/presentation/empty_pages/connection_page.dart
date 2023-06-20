import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';


class ConnectionErrorPage extends StatelessWidget {
  const ConnectionErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const EmptyPageMessege(
            icon: Icons.wifi_off_rounded,
            mainTitle: 'No internet Connection',
            subTitle:
                'Your internet connection is currently\nnot available please check or try again.',
          ),
          CommonButton(
            title: 'Try again',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
