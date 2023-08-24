import 'package:app_boilerplate/features/expenses/presentation/screen/widgets/chart.dart';
import 'package:app_boilerplate/features/expenses/presentation/screen/widgets/list_expenses.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

@RoutePage()
class ExpensesPage extends ConsumerStatefulWidget {
  const ExpensesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends ConsumerState<ExpensesPage>
    with TickerProviderStateMixin {
  late final TabController tabbarController;

  @override
  void initState() {
    tabbarController =
        TabController(length: myTabs.length, initialIndex: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabbarController.dispose();
    super.dispose();
  }

  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Daily',
    ),
    Tab(
      text: 'Weekly',
    ),
    Tab(
      text: 'Monthly',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return BasePage(
      appBarTitle: l10n.expenseDetail,
      actions: const [
        Icon(Icons.more_vert),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBar(
            indicatorColor: Colors.green,
            controller: tabbarController,
            tabs: myTabs,
            labelColor: theme.colorScheme.primary,
            labelStyle: theme.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
            unselectedLabelColor: const Color(0xff77838F),
            splashBorderRadius: BorderRadius.circular(10),
            indicator: RectangularIndicator(
              bottomLeftRadius: 10,
              bottomRightRadius: 10,
              topLeftRadius: 10,
              topRightRadius: 10,
              color: Colors.white,
              verticalPadding: 5,
              horizontalPadding: 5,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabbarController,
        children: myTabs.map((Tab tab) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Chart(),
              ).animate().fade(duration: 400.ms).move(
                    begin: const Offset(0, 20),
                    curve: Curves.fastOutSlowIn,
                    delay: 200.ms,
                  ),
              const ListExpenses(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
