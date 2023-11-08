import 'package:flutter/material.dart';

class AddtransactionProvider with ChangeNotifier {
  int _amount = 0;
  int get amount => _amount;

  void addamount(int money) {
    _amount = money;
    notifyListeners();
  }
}
