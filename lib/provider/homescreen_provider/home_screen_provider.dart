import 'package:flutter/material.dart';

import '../../view/screen/home_screen/model/card_model.dart';

class AddtransactionProvider with ChangeNotifier {
// for adding the amount
  TextEditingController digitcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  int _amount = 0;
  int get amount => _amount;

  void totalamount(int money) {
    _amount += money;
    notifyListeners();
  }

  // for the income and expenses
  final List<String> _choice = ["Income", "Expenses"];
  List<String> get choice => _choice;
  String _select = "Income";
  String get select => _select;

  void change(int index) {
    _select = choice[index];
    notifyListeners();
  }

// income
  int _income = 0;
  int get income => _income;

  void addamount(int money) {
    _income += money;
    notifyListeners();
  }

// expenses
  int _expense = 000;
  int get expense => _expense;

  void decreaseamount(int money) {
    _amount -= money;
    _expense += money;
    notifyListeners();
  }

  // list of the transaction

  final List<Transaction> _value = [];
  List<Transaction> get value => _value;

  void enter(int money, String type) {
    _value.add(Transaction(
      money,
      amount,
      type,
    ));
  }
}
