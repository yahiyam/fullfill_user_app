import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/item.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:fullfill_user_app/view/cart/functions/assistant_methods.dart';
import 'package:fullfill_user_app/view_model/item_detail/stepper_provider.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:fullfill_user_app/utils/toast_message.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonButton(
          title: 'Add to Cart',
          onTap: () {
            final stepperProvider =
                Provider.of<StepperProvider>(context, listen: false);
            final separateItemIDsList = separateItemIDs();

            if (separateItemIDsList.contains(item.itemID)) {
              ToastMessage.show(context, 'Item is already in cart');
            } else {
              addItemToCart(context, item.itemID, stepperProvider.itemCount);
            }
          },
        ),
        SizedBox(height: Screen.height(3)),
      ],
    );
  }
}
