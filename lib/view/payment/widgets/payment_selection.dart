import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:fullfill_user_app/view/payment/widgets/payment_type_card.dart';
import 'package:fullfill_user_app/view_model/payment/payment_selection_view_model.dart';
import 'package:provider/provider.dart';

class PaymentSelection extends StatelessWidget {
  const PaymentSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Container(
            height: Screen.height(28),
            width: double.infinity,
            decoration: BoxDecoration(
              color: white70,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Consumer<PaymentSelectionViewModel>(
              builder: (context, paymentSelector, _) {
                return Center(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final isSelected =
                          index == paymentSelector.selectedPaymentIndex;
                      return PaymentTypeCard(
                        type: paymentSelector.paymentLabels[index],
                        icon: paymentSelector.paymentIcons[index],
                        iconBGcolor: paymentSelector.paymentIconsColor[index],
                        isSelected: isSelected,
                        onTap: () => paymentSelector.selectPaymentType(index),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        indent: 20,
                        endIndent: 20,
                        color: backgroundColor,
                      );
                    },
                    itemCount: paymentSelector.paymentLabels.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Consumer<StripeViewModel>(
    //         builder: (context, stripe, child) {
    //           return TextButton(
    //             child: const Text('Select Payment'),
    //             onPressed: ()async {
    //               log('objectStart');
    //               await stripe.selectPayment();
    //               log('objectEnd');
    //             },
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
    // return ListView.separated(
    //   shrinkWrap: true,
    //   itemCount: paymentLabels.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       leading: Radio(
    //         activeColor: commonColor,
    //         value: index,
    //         groupValue: value,
    //         onChanged: (i) => value = i!,
    //       ),
    //       title: Text(
    //         paymentLabels[index],
    //         style: const TextStyle(color: black),
    //       ),
    //       trailing: Icon(paymentIcons[index], color: commonColor),
    //     );
    //   },
    //   separatorBuilder: (context, index) {
    //     return const Divider();
    //   },
    // );