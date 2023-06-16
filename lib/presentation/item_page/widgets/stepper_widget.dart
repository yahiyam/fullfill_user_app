import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/provider/stepper_provider.dart';
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
    final Size screen = MediaQuery.of(context).size;
    return Consumer<StepperProvider>(
      builder: (context, cartProvider, _) {
        return Container(
          width: isSmall ? screen.width / 2.4 / 5 * 4 : screen.width / 2.4,
          height: checkSmall(screen.height / 12.4),
          decoration: BoxDecoration(
            color: transparent15,
            borderRadius: BorderRadius.circular(checkSmall(screen.width / 20)),
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
                  size: checkSmall(screen.width / 14),
                ),
                splashColor: transparent,
              ),
              CircleAvatar(
                radius: checkSmall(screen.width / 14),
                backgroundColor: white,
                child: Text(
                  '${cartProvider.itemCount}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: checkSmall(screen.width / 14),
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
                  size: checkSmall(screen.width / 14),
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
