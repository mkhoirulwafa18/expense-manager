import 'package:app_boilerplate/features/home/domain/card_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expensesProvider = StateNotifierProvider<Counter, List<CardTransaction>>(
  (ref) => Counter(),
);

class Counter extends StateNotifier<List<CardTransaction>> {
  Counter()
      : super([
          CardTransaction(
            name: 'Supermarket Shopping',
            amount: 147,
            to: 'Rainbow Market',
            icon: Icons.shopping_bag,
          ),
          CardTransaction(
            name: 'Tech Store Shopping',
            amount: 860,
            to: 'Prima Computer',
            icon: Icons.computer,
          ),
          CardTransaction(
            name: 'Flight Ticket',
            amount: 340.55,
            to: 'Garuda Indonesia',
            icon: Icons.flight,
          ),
          CardTransaction(
            name: 'Bank Loan',
            amount: 1500,
            to: 'Bank BCA',
            icon: Icons.money_rounded,
          ),
          CardTransaction(
            name: 'Green Grocery Shopping',
            amount: 89,
            to: 'Vitamin Grocery',
            icon: Icons.shopping_bag,
          ),
        ]);
}
