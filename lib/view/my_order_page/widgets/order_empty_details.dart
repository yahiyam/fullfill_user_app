import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:fullfill_user_app/utils/empty_page_message.dart';

Column buildOrdersEmptyDetails(BuildContext context) {
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
