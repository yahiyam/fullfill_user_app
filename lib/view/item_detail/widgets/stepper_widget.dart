import 'package:flutter/material.dart';
import 'package:fullfill_user_app/utils/colors.dart';
import 'package:fullfill_user_app/utils/screen_size.dart';
import 'package:fullfill_user_app/view_model/item_detail/stepper_provider.dart';
import 'package:provider/provider.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    super.key,
    this.isSmall = false,
  });
  final bool isSmall;

  double checkSmall(double length) {
    if (isSmall) {
      return length / 2;
    } else {
      return length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StepperProvider>(
      builder: (context, cartProvider, _) {
        return Container(
          width: isSmall ? Screen.width(33) : Screen.width(41.6),
          height: checkSmall(Screen.height(8)),
          decoration: BoxDecoration(
            color: transparent15,
            borderRadius: BorderRadius.circular(checkSmall(Screen.width(5))),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  cartProvider.decrementItemCount();
                },
                icon: Icon(
                  Icons.remove,
                  color: cartProvider.itemCount == 1 ? black12 : black54,
                  size: checkSmall(Screen.width(7)),
                ),
                splashColor: transparent,
              ),
              CircleAvatar(
                radius: checkSmall(Screen.width(7)),
                backgroundColor: white,
                child: Text(
                  '${cartProvider.itemCount}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: checkSmall(Screen.width(7)),
                    color: black,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  cartProvider.incrementItemCount();
                },
                icon: Icon(
                  Icons.add,
                  color: commonColor,
                  size: checkSmall(Screen.width(7)),
                ),
                splashColor: transparent,
              ),
            ],
          ),
        );
      },
    );
  }
}
