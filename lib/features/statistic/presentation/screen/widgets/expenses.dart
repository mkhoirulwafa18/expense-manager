import 'package:app_boilerplate/features/statistic/presentation/provider/expenses_provider.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Expenses extends ConsumerWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final expenses = ref.watch(expensesProvider);

    return Flexible(
      child: Section(
        titleSection: l10n.allExpenses,
        content: ListView.builder(
          itemCount: expenses.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                expenses[index].name,
                style: theme.textTheme.bodyMedium,
              ),
              subtitle: Text(
                expenses[index].to ?? '',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
              trailing: Text(
                '\$${expenses[index].amount}',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.primary),
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
