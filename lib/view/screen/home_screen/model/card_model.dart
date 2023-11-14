import 'package:flutter/material.dart';

class Transaction {
  int? enteramount;
  int? totalamount;
  String? type;
  IconData? icon;
  Color? color;

  Transaction({
    this.enteramount,
    this.totalamount,
    this.type,
    this.icon,
    this.color,
  });
}
