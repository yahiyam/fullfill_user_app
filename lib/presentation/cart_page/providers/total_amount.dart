import 'package:flutter/cupertino.dart';

class TotalAmount extends ChangeNotifier {
  double get totalAmount => _totalAmount;

  displayTotalAmount(double number) async {
    _totalAmount = number;

    await Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  double _totalAmount = 0;
  double _taxPercentage = 3;
  double _deliveryCharge = 25;
  double _discountPercentage = 5;

  double get subtotal => _totalAmount;
  double get taxPercentage => _taxPercentage;
  double get deliveryCharge => _deliveryCharge;
  double get discountPercentage => _discountPercentage;

  double get taxAmount {
    return roundToTwoDecimalPlaces(
      _totalAmount * (_taxPercentage / 100),
    );
  }

  double get discountAmount {
    return roundToTwoDecimalPlaces(
      _totalAmount * (_discountPercentage / 100),
    );
  }

  double get grandTotal {
    return roundToTwoDecimalPlaces(
      subtotal + deliveryCharge + taxAmount - discountAmount,
    );
  }

  void updateSubtotal(double newSubtotal) {
    _totalAmount = newSubtotal;
    notifyListeners();
  }

  void updateDeliveryCharge(double newDeliveryCharge) {
    _deliveryCharge = newDeliveryCharge;
    notifyListeners();
  }

  void updateDiscountPercentage(double newDiscountPercentage) {
    _discountPercentage = newDiscountPercentage;
    notifyListeners();
  }

  void updateTaxPercentage(double newTaxPercentage) {
    _taxPercentage = newTaxPercentage;
    notifyListeners();
  }

  double roundToTwoDecimalPlaces(double value) {
    return double.parse(value.toStringAsFixed(2));
  }
}
