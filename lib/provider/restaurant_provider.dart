import 'package:flutter/material.dart';

class RestaurantProvider extends ChangeNotifier {
  // Define the state variables
  List<String> foods = [];
  List<String> drinks = [];
  List<String> snacks = [];
  List<String> sauces = [];

  // Fetch the restaurant data
  Future<void> fetchRestaurantData() async {
    // Simulate fetching data from an API
    await Future.delayed(const Duration(seconds: 2));

    // Update the state variables with the fetched data
    foods = ['Food 1', 'Food 2', 'Food 3'];
    drinks = ['Drink 1', 'Drink 2', 'Drink 3'];
    snacks = ['Snack 1', 'Snack 2', 'Snack 3'];
    sauces = ['Sauce 1', 'Sauce 2', 'Sauce 3'];

    // Notify the listeners that the state has changed
    notifyListeners();
  }
}
