import 'package:flutter/material.dart';

class CartSummaryProvider with ChangeNotifier {
  double _subtotal = 0;
  double _taxPercentage = 0;
  double _deliveryCharge = 0;
  double _discountPercentage = 0;

  double get subtotal => _subtotal;
  double get taxPercentage => _taxPercentage;
  double get deliveryCharge => _deliveryCharge;
  double get discountPercentage => _discountPercentage;

  double get taxAmount {
    return roundToTwoDecimalPlaces(
      _subtotal * (_taxPercentage / 100),
    );
  }

  double get discountAmount {
    return roundToTwoDecimalPlaces(
      _subtotal * (_discountPercentage / 100),
    );
  }

  double get grandTotal {
    return roundToTwoDecimalPlaces(
      subtotal + deliveryCharge + taxAmount - discountAmount,
    );
  }

  void updateSubtotal(double newSubtotal) {
    _subtotal = newSubtotal;
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
