import 'package:flutter/material.dart';
import 'package:fullfill_user_app/main.dart';

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
            child: EmptyPageMessege(
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
