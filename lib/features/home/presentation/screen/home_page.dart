import 'package:app_boilerplate/features/home/presentation/screen/widgets/all_transaction.dart';
import 'package:app_boilerplate/features/home/presentation/screen/widgets/card_balance.dart';
import 'package:app_boilerplate/features/home/presentation/screen/widgets/recorded_transaction.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/theme/app_theme.dart';
import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<Widget> homeWidgets = AnimateList(
    interval: 1000.ms,
    effects: [
      FadeEffect(duration: 500.ms),
      MoveEffect(
        begin: const Offset(0, 20),
        delay: 400.ms,
        curve: Curves.fastOutSlowIn,
      ),
    ],
    children: const [
      Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: CardBalance(),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: RecordedTrx(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BasePage(
      appBarTitle: l10n.home,
      actions: [
        IconButton.filled(
          onPressed: () => ref.read(appThemeProvider.notifier).toggleTheme(),
          icon: const Icon(Icons.sunny),
        ),
      ],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...homeWidgets,
          // AllTrx widget is separated to get rid of warning "Incorrect use of ParentData"
          // because AllTrx is using expanded as a root and an expanded expect to be placed
          // only inside Column or Flexible, not animation widget.
          const AllTrx(),
        ],
      ),
    );
  }
}
