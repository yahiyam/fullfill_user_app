import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/cart_page/functions/assistant_methods.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/strings.dart';
import 'package:fullfill_user_app/data/models/items.dart';
import 'package:fullfill_user_app/presentation/item_page/widgets/stepper_widget.dart';
import 'package:fullfill_user_app/presentation/item_page/providers/stepper_provider.dart';
import 'package:fullfill_user_app/utils/cart_icon_button.dart';
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
    final StepperProvider stepper = Provider.of<StepperProvider>(context);
    final Size screen = MediaQuery.of(context).size;

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
            CartIconButton(sellerUID: item.sellerUID!),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildContentSection(item, screen),
            buildHeadingSection(
              item.title?.toUpperCase() ?? 'Food Name'.toUpperCase(),
              '${item.price! * stepper.itemCount} $rupee',
              screen,
            ),
            buildBodySection(item.shortInfo ?? "Food's short info", screen),
            CommonButton(
              title: 'Add to cart',
              onTap: () {
                List<String> separateItemIDsList = separateItemIDs();
                separateItemIDsList.contains(item.itemID)
                    ? ToastMessage.show(context, "Item is already in cart")
                    : addItemToCart(context, item.itemID, stepper.itemCount);
              },
            ),
            SizedBox(height: screen.height / 30),
          ],
        ),
      ),
    );
  }
}

Widget buildHeadingSection(String title, String prize, Size screen) {
  return SizedBox(
    height: screen.height / 2.4 / 4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 28),
        ),
        Text(
          prize,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            color: commonColor,
          ),
        ),
      ],
    ),
  );
}

Widget buildBodySection(String shortInfo, Size screen) {
  return SizedBox(
    height: screen.height / 2.4 / 4 * 3,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: screen.width / 10),
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
            shortInfo,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildContentSection(Items item, Size screen) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      SizedBox(
        height: screen.height / 3,
      ),
      CircleAvatar(
        radius: screen.height / 7.2,
        backgroundImage: NetworkImage(item.thumbnailUrl ?? netImage),
      ),
      Container(
        height: screen.height / 3.6,
        width: screen.height / 3.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screen.height / 7.2),
          gradient: RadialGradient(
            colors: [
              ...List.filled(6, Colors.transparent),
              backgroundColor!,
            ],
          ),
        ),
      ),
      Positioned(
        top: screen.height / 4,
        child: const StepperWidget(),
      ),
    ],
  );
}
