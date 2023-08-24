import 'package:app_boilerplate/features/statistic/presentation/screen/widgets/dashboard.dart';
import 'package:app_boilerplate/features/statistic/presentation/screen/widgets/expenses.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class StatisticPage extends ConsumerWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return BasePage(
      appBarTitle: l10n.statistic,
      actions: const [
        Icon(Icons.tune),
      ],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Dashboard(),
          ).animate().fade(duration: 400.ms).move(
                begin: const Offset(0, 20),
                curve: Curves.fastOutSlowIn,
                delay: 200.ms,
              ),
          const Expenses(),
        ],
      ),
    );
  }
}
