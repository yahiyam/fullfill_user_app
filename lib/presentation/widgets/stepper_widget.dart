import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/provider/stepper_provider.dart';
import 'package:provider/provider.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        return Container(
          width: screen.width / 2.4,
          height: screen.height / 12.4,
          decoration: BoxDecoration(
            color: transparent15 ,
            borderRadius: BorderRadius.circular(screen.width / 20),
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
                  color: cartProvider.itemCount == 1
                      ? black12
                      : black54,
                  size: screen.width / 14,
                ),
                splashColor: transparent,
              ),
              CircleAvatar(
                radius: screen.width / 14,
                backgroundColor: white,
                child: Text(
                  '${cartProvider.itemCount}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screen.width / 14,
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
                  size: screen.width / 14,
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
