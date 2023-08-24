import 'package:app_boilerplate/features/statistic/presentation/provider/expenses_provider.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListExpenses extends ConsumerWidget {
  const ListExpenses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final expenses = ref.watch(expensesProvider);
    return Expanded(
      child: Section(
        titleSection: 'Wed, 9 June 2023',
        content: ListView.builder(
          itemCount: expenses.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 65,
              child: Card(
                elevation: 1,
                child: ListTile(
                  title: Text(expenses[index].name),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        expenses[index].icon,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  trailing: Text(
                    '\$${expenses[index].amount}',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.error),
                  ),
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
