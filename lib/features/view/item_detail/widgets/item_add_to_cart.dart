import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/common_button.dart';
import '../../../../utils/screen_size.dart';
import '../../../../utils/toast_message.dart';
import '../../../data/models/item.dart';
import '../../../view_model/item_detail/stepper_provider.dart';
import '../../cart/functions/assistant_methods.dart';

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
