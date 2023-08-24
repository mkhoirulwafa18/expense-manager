import 'package:app_boilerplate/features/home/presentation/provider/transactions_provider.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllTrx extends ConsumerWidget {
  const AllTrx({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final transactions = ref.watch(transactionsProvider);

    return Expanded(
      child: Section(
        titleSection: l10n.allTrx,
        content: ListView.builder(
          itemCount: transactions.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 80,
              child: Card(
                elevation: 1,
                child: ListTile(
                  title: Text(transactions[index].name),
                  subtitle: Text('\$${transactions[index].amount}'),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        transactions[index].icon,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons.more_vert),
                ),
              ),
            ).animate(delay: (400 * index).ms).fade(duration: 400.ms).move(
                  begin: const Offset(0, 30),
                  curve: Curves.fastOutSlowIn,
                  delay: 200.ms,
                );
          },
        ),
      ),
    );
  }
}
