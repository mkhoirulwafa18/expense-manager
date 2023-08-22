import 'package:app_boilerplate/features/statistic/presentation/provider/expenses_provider.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

const initialPage = 1.0;

@RoutePage()
class ExpensesPage extends ConsumerStatefulWidget {
  const ExpensesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends ConsumerState<ExpensesPage>
    with TickerProviderStateMixin {
  late final TabController tabbarController;
  final double _currentPage = initialPage;

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
    final expenses = ref.watch(expensesProvider);
    return BasePage(
      appBarTitle: 'Expense Details',
      actions: const [
        Icon(Icons.tune),
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
          final label = tab.text!.toLowerCase();
          return Column(
            children: [
              const Section(
                titleSection: '17 June 2023 - 23 June 2023',
                subtitleSection: r'$4,700.00',
                content: Placeholder(
                  child: SizedBox(
                    height: 200,
                    width: double.maxFinite,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Section(
                titleSection: 'Wed, 9 June 2023',
                content: SizedBox(
                  height: 230,
                  child: ListView.builder(
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
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
      // Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     // =====DASHBOARD SECTION=====
      //     Section(
      //       titleSection: 'Dashboard',
      //       action: DropdownButton(
      //         value: 'week',
      //         items: dropdownItems,
      //         onChanged: (value) {},
      //         underline: const SizedBox(),
      //         style: theme.textTheme.bodyMedium
      //             ?.copyWith(color: theme.colorScheme.primary),
      //         icon: Icon(
      //           Icons.keyboard_arrow_down_rounded,
      //           color: theme.colorScheme.primary,
      //         ),
      //       ),
      //       content: SizedBox(
      //         height: 240,
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: theme.colorScheme.background,
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //           width: MediaQuery.of(context).size.width,
      //           padding: const EdgeInsets.all(10),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "Last week's expenses",
      //                 style: theme.textTheme.bodyMedium
      //                     ?.copyWith(fontWeight: FontWeight.w500),
      //               ),
      //               const SizedBox(
      //                 height: 9,
      //               ),
      //               Text(
      //                 r'$3,500.00',
      //                 style: theme.textTheme.bodyMedium
      //                     ?.copyWith(color: Colors.grey),
      //               ),
      //               const SizedBox(
      //                 height: 9,
      //               ),
      //               Placeholder(
      //                 child: SizedBox(
      //                   height: 156,
      //                   width: MediaQuery.of(context).size.width,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     // =====END DASHBOARD SECTION=====

      //     // =====EXPENSES SECTION=====
      //     Section(
      //       titleSection: 'All Expenses',
      //       content: SizedBox(
      //         height: 220,
      //         child: ListView.builder(
      //           itemCount: expenses.length,
      //           shrinkWrap: true,
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               title: Text(
      //                 expenses[index].name,
      //                 style: theme.textTheme.bodyMedium,
      //               ),
      //               subtitle: Text(
      //                 expenses[index].to ?? '',
      //                 style: theme.textTheme.bodyMedium
      //                     ?.copyWith(color: Colors.grey),
      //               ),
      //               trailing: Text(
      //                 '\$${expenses[index].amount}',
      //                 style: theme.textTheme.bodyMedium
      //                     ?.copyWith(color: theme.colorScheme.primary),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ),
      //     // =====END EXPENSES SECTION=====
      //   ],
      // ),
    );
  }
}
