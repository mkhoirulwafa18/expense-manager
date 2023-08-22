import 'package:flutter/material.dart';

class CardTransaction {
  CardTransaction({
    required this.name,
    required this.amount,
    required this.icon,
    this.to,
  });

  final String name;
  final double amount;
  final String? to;
  final IconData icon;
}
