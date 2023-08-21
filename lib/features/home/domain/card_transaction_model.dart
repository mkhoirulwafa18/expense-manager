import 'package:flutter/material.dart';

class CardTransaction {
  CardTransaction({
    required this.name,
    required this.amount,
    required this.icon,
  });

  final String name;
  final double amount;
  final IconData icon;
}
