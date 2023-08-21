import 'package:app_boilerplate/features/home/domain/recorded_transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recordedTrxProvider =
    StateNotifierProvider<Counter, List<RecordedTransaction>>(
  (ref) => Counter(),
);

class Counter extends StateNotifier<List<RecordedTransaction>> {
  Counter()
      : super([
          RecordedTransaction(title: 'Bill Payment', total: 200.56),
          RecordedTransaction(title: 'Transfers', total: 1300),
          RecordedTransaction(title: 'Loans', total: 120.50),
        ]);
}
