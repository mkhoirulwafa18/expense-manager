import 'package:app_boilerplate/features/home/domain/card_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionsProvider =
    StateNotifierProvider<Counter, List<CardTransaction>>(
  (ref) => Counter(),
);

class Counter extends StateNotifier<List<CardTransaction>> {
  Counter()
      : super([
          CardTransaction(
            name: 'Education Expenses',
            amount: 475,
            icon: Icons.menu_book_rounded,
          ),
          CardTransaction(
            name: 'Coffee Shopping',
            amount: 25,
            icon: Icons.coffee_rounded,
          ),
          CardTransaction(
            name: 'Upgrade PC',
            amount: 450.55,
            icon: Icons.computer_rounded,
          ),
        ]);
}
