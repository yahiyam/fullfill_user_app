import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/presentation/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/presentation/item_page/providers/stepper_provider.dart';
import 'package:fullfill_user_app/utils/common_button.dart';
import 'package:fullfill_user_app/utils/toast_message.dart';
import 'package:provider/provider.dart';

Widget buildAddToCartButton(BuildContext context, Items item) {
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
