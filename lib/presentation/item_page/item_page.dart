import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/screen_size.dart';
import 'package:fullfill_user_app/presentation/cart_page/cart_page.dart';
import 'package:fullfill_user_app/presentation/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/strings.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/presentation/cart_page/providers/cart_item_counter_provider.dart';
import 'package:fullfill_user_app/presentation/item_page/widgets/stepper_widget.dart';
import 'package:fullfill_user_app/presentation/item_page/providers/stepper_provider.dart';
import 'package:fullfill_user_app/utils/common_widgets.dart';
import 'package:fullfill_user_app/utils/toast_message.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({
    super.key,
    required this.item,
  });
  final Items item;

  @override
  Widget build(BuildContext context) {
    final StepperProvider stepper =
        Provider.of<StepperProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        stepper.reset();
        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
              ),
            ),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CartPage(
                          sellerUID: item.sellerUID!,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.brightness_1,
                        size: 20.0,
                        color: black,
                      ),
                      Positioned(
                        top: 2,
                        right: 6,
                        child: Center(
                          child: Consumer<CartItemCounter>(
                            builder: (context, counter, _) {
                              return Text(
                                counter.count.toString(),
                                style: const TextStyle(
                                  color: white,
                                  fontSize: 12,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: Screen.height(33),
                ),
                CircleAvatar(
                  radius: Screen.height(13.8),
                  backgroundImage: NetworkImage(item.thumbnailUrl ?? netImage),
                ),
                Container(
                  height: Screen.height(27.7),
                  width: Screen.height(27.7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Screen.height(13.8)),
                    gradient: RadialGradient(
                      colors: [
                        ...List.filled(6, Colors.transparent),
                        backgroundColor!,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: Screen.height(25),
                  child: const StepperWidget(),
                ),
              ],
            ),
            SizedBox(
              height: Screen.height(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.title?.toUpperCase() ?? 'Food Name'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 28),
                  ),
                  Text(
                    '${item.price! * stepper.itemCount} $rupee',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      color: commonColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Screen.height(31),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Screen.width(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Food's short info".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      item.shortInfo ?? "Food's short info",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CommonButton(
              title: 'Add to cart',
              onTap: () {
                List<String> separateItemIDsList = separateItemIDs();
                separateItemIDsList.contains(item.itemID)
                    ? ToastMessage.show(context, "Item is already in cart")
                    : addItemToCart(context, item.itemID, stepper.itemCount);
              },
            ),
            SizedBox(height: Screen.height(3)),
          ],
        ),
      ),
    );
  }
}
