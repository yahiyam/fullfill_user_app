import 'package:flutter/material.dart';
import '../../../utils/empty_page_message.dart';
import '../../../utils/widgets/simple_app_bar.dart';

class MyOfferPage extends StatelessWidget {
  const MyOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar( title: 'My offers'),
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
