import 'package:flutter/material.dart';

import '../../../../utils/common_button.dart';
import '../../../../utils/empty_page_message.dart';

class OrdersEmptyDetails extends StatelessWidget {
  const OrdersEmptyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const EmptyPageMessage(
          icon: Icons.import_contacts_rounded,
          mainTitle: 'No Orders',
          subTitle: 'Continue ordering from home page.',
        ),
        CommonButton(
          title: "Let's order ",
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          },
        )
      ],
    );
  }
}
