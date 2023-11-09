import 'package:flutter/material.dart';

class AddtransactionProvider with ChangeNotifier {
  int _amount = 0;
  int get amount => _amount;

  void totalamount(int money) {
    _amount += money;
    notifyListeners();
  }

  final List<int> _transaction = [];
  List<int> get transaction => _transaction;
}
