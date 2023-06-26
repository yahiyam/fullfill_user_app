import 'package:flutter/material.dart';
import 'package:fullfill_user_app/data/services/cart_service.dart';
import 'package:provider/provider.dart';

import 'package:fullfill_user_app/global/instence.dart';

import 'package:fullfill_user_app/view/cart_page/providers/cart_item_counter_provider.dart';
import 'package:fullfill_user_app/view/home_page/home_page.dart';

import 'package:fullfill_user_app/utils/toast_message.dart';

final CartService _cartService = CartService();

separateItemIDs() {
  List<String> separateItemIDsList = [], defaultItemList = [];
  int i = 0;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for (i; i < defaultItemList.length; i++) {
    String item = defaultItemList[i].toString();
    var pos = item.lastIndexOf(":");

    String getItemId = (pos != -1) ? item.substring(0, pos) : item;

    separateItemIDsList.add(getItemId);
  }

  return separateItemIDsList;
}

separateItemQuantities() {
  List<int> separateItemQuantityList = [];
  List<String> defaultItemList = [];
  int i = 1;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for (i; i < defaultItemList.length; i++) {
    String item = defaultItemList[i].toString();
    List<String> listItemCharacters = item.split(":").toList();
    var quanNumber = int.parse(listItemCharacters[1].toString());
    separateItemQuantityList.add(quanNumber);
  }
  return separateItemQuantityList;
}

addItemToCart(BuildContext context, String? foodItemId, int itemCounter) {
  List<String>? tempList = sharedPreferences!.getStringList("userCart");
  tempList!.add("${foodItemId!}:$itemCounter");

  _cartService.addItemToCart(tempList).then((value) {
    ToastMessage.show(context, "Item Added Successfully.");

    sharedPreferences!.setStringList("userCart", tempList);

    //update the badge
    Provider.of<CartItemCounter>(context, listen: false)
        .displayCartListItemsNumber();
  });
}

clearCartNow(context) {
  sharedPreferences!.setStringList("userCart", ['garbageValue']);
  List<String>? emptyList = sharedPreferences!.getStringList("userCart");

  _cartService.clearCartNow(emptyList).then((value) {
    sharedPreferences!.setStringList("userCart", emptyList!);
  });
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomePage()),
      (route) => false);
  Provider.of<CartItemCounter>(context, listen: false)
      .displayCartListItemsNumber();

  ToastMessage.show(context, 'Cart has been cleared');
}
