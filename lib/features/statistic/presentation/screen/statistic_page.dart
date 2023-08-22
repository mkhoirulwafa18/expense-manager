import 'package:app_boilerplate/features/statistic/presentation/provider/expenses_provider.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  final menuItems = <DropdownMenuItem<String>>[
    const DropdownMenuItem(value: 'day', child: Text('1 day')),
    const DropdownMenuItem(value: 'week', child: Text('1 week')),
    const DropdownMenuItem(value: 'month', child: Text('1 month')),
  ];
  return menuItems;
}

@RoutePage()
class StatisticPage extends ConsumerWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final expenses = ref.watch(expensesProvider);
    return BasePage(
      appBarTitle: l10n.statistic,
      actions: const [
        Icon(Icons.tune),
      ],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // =====DASHBOARD SECTION=====
          Section(
            titleSection: 'Dashboard',
            action: DropdownButton(
              value: 'week',
              items: dropdownItems,
              onChanged: (value) {},
              underline: const SizedBox(),
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.primary),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: theme.colorScheme.primary,
              ),
            ),
            content: SizedBox(
              height: 240,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last week's expenses",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      r'$3,500.00',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Placeholder(
                      child: SizedBox(
                        height: 156,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // =====END DASHBOARD SECTION=====
          const SizedBox(
            height: 20,
          ),
          // =====EXPENSES SECTION=====
          Section(
            titleSection: 'All Expenses',
            content: SizedBox(
              height: 250,
              child: ListView.builder(
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
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                    trailing: Text(
                      '\$${expenses[index].amount}',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.colorScheme.primary),
                    ),
                  );
                },
              ),
            ),
          ),
          // =====END EXPENSES SECTION=====
        ],
      ),
    );
  }
}
