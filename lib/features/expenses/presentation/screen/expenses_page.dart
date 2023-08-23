import 'package:app_boilerplate/features/statistic/presentation/provider/expenses_provider.dart';
import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/theme/app_colors.dart';
import 'package:app_boilerplate/shared/widgets/base_page.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

int touchedIndex = -1;
BarChartGroupData makeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  Color? barColor,
  double width = 15,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: isTouched ? y + 1 : y,
        color: isTouched ? AppColors.error : AppColors.primary,
        width: width,
        borderSide: isTouched
            ? const BorderSide(color: AppColors.primary)
            : const BorderSide(color: AppColors.error, width: 0),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 900,
          color: AppColors.black.withOpacity(0.05),
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, 300, isTouched: i == touchedIndex);
        case 1:
          return makeGroupData(1, 600, isTouched: i == touchedIndex);
        case 2:
          return makeGroupData(2, 400, isTouched: i == touchedIndex);
        case 3:
          return makeGroupData(3, 750, isTouched: i == touchedIndex);
        case 4:
          return makeGroupData(4, 900, isTouched: i == touchedIndex);
        case 5:
          return makeGroupData(5, 190, isTouched: i == touchedIndex);
        case 6:
          return makeGroupData(6, 555, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChartData mainBarData() {
  return BarChartData(
    barTouchData: BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.blueGrey,
        tooltipHorizontalAlignment: FLHorizontalAlignment.center,
        tooltipMargin: -10,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String weekDay;
          switch (group.x) {
            case 0:
              weekDay = 'Monday';
            case 1:
              weekDay = 'Tuesday';
            case 2:
              weekDay = 'Wednesday';
            case 3:
              weekDay = 'Thursday';
            case 4:
              weekDay = 'Friday';
            case 5:
              weekDay = 'Saturday';
            case 6:
              weekDay = 'Sunday';
            default:
              throw Error();
          }
          return BarTooltipItem(
            '$weekDay\n',
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '\$${rod.toY}',
                style: const TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    ),
    titlesData: const FlTitlesData(
      rightTitles: AxisTitles(),
      topTitles: AxisTitles(),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: getTitles,
          reservedSize: 38,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: leftTitles,
          reservedSize: 38,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: showingGroups(),
    gridData: const FlGridData(show: false),
  );
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: AppColors.lightGrey,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Mon', style: style);
    case 1:
      text = const Text('Tue', style: style);
    case 2:
      text = const Text('Wed', style: style);
    case 3:
      text = const Text('Thu', style: style);
    case 4:
      text = const Text('Fri', style: style);
    case 5:
      text = const Text('Sat', style: style);
    case 6:
      text = const Text('Sun', style: style);
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: AppColors.lightGrey,
  );
  String text;
  if (value == 0) {
    text = r'$100';
  } else if (value == 200) {
    text = r'$200';
  } else if (value == 300) {
    text = r'$300';
  } else if (value == 400) {
    text = r'$400';
  } else if (value == 500) {
    text = r'$500';
  } else if (value == 600) {
    text = r'$600';
  } else if (value == 700) {
    text = r'$700';
  } else if (value == 800) {
    text = r'$800';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}

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
    final expenses = ref.watch(expensesProvider);
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
          // final label = tab.text!.toLowerCase();
          return Column(
            children: [
              Section(
                titleSection: '17 June 2023 - 23 June 2023',
                subtitleSection: r'$4,700.00',
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 200,
                    width: double.maxFinite - 20,
                    child: BarChart(
                      mainBarData(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
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
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
