import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/theme/app_theme.dart';
import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class StatisticPage extends ConsumerWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return BasePage(
      appBarTitle: l10n.statistic,
      actions: const [
        Icon(Icons.tune),
      ],
      body: Placeholder(),
    );
  }
}
