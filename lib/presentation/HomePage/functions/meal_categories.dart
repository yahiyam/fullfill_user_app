String getMealCategory() {
  DateTime now = DateTime.now();
  int currentHour = now.hour;

  if (7 <= currentHour && currentHour < 10) {
    return 'Breakfast';
  } else if (10 <= currentHour && currentHour < 12) {
    return 'Brunch';
  } else if (12 <= currentHour && currentHour < 14) {
    return 'Lunch';
  } else if (14 <= currentHour && currentHour < 18) {
    return 'Snack';
  } else if (18 <= currentHour && currentHour < 21) {
    return 'Dinner';
  } else {
    return 'Supper';
  }
}
