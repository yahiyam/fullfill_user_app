import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/common_widgets.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';

class MyOfferPage extends StatelessWidget {
  const MyOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'My offers'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: EmptyPageMessage(
              mainTitle: 'ohh snap! No offers yet',
              subTitle: 'please check again later.',
            ),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
