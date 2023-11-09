import 'package:flutter/material.dart';

class AddtransactionProvider with ChangeNotifier {
// for adding the amount
  TextEditingController controller = TextEditingController();
  int _amount = 0;
  int get amount => _amount;

  void totalamount(int money) {
    _amount += money;
    notifyListeners();
  }

// for the transaction statement
  final List<int> _transaction = [];
  List<int> get transaction => _transaction;

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
  }

// expenses
  int _expense = 000;
  int get expense => _expense;

  void decreaseamount(int money) {
    _amount -= money;
    _expense += money;
    notifyListeners();
  }
}
