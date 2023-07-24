import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class PaymentSelectionViewModel extends ChangeNotifier {
  final List<String> _paymentLabels = [
    'Credit card / Debit card',
    'UPI',
    'Cash on delivery',
  ];
  final List<IconData> _paymentIcons = [
    Icons.payment,
    Icons.account_balance_rounded,
    Icons.attach_money,
  ];
  final List<Color> _paymentIconsColor = [
    commonColor,
    pink,
    green,
  ];
  int _selectedPaymentIndex = 0;

  String get selectedPaymentType => _paymentLabels[_selectedPaymentIndex];
  List<String> get paymentLabels => _paymentLabels;
  List<IconData> get paymentIcons => _paymentIcons;
  List<Color> get paymentIconsColor => _paymentIconsColor;
  int get selectedPaymentIndex => _selectedPaymentIndex;

  void selectPaymentType(int index) {
    _selectedPaymentIndex = index;
    notifyListeners();
  }
}
