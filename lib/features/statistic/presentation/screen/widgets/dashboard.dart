import 'package:app_boilerplate/l10n/l10n.dart';
import 'package:app_boilerplate/shared/theme/app_colors.dart';
import 'package:app_boilerplate/shared/widgets/section.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  final menuItems = <DropdownMenuItem<String>>[
    const DropdownMenuItem(value: 'day', child: Text('1 day')),
    const DropdownMenuItem(value: 'week', child: Text('1 week')),
    const DropdownMenuItem(value: 'month', child: Text('1 month')),
  ];
  return menuItems;
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Mon');
    case 2:
      text = const Text('Tue');
    case 4:
      text = const Text('Wed');
    case 6:
      text = const Text('Thu');
    case 8:
      text = const Text('Fri');
    case 10:
      text = const Text('Sat');
    case 11:
      text = const Text('Sun');
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      verticalInterval: 2,
      drawHorizontalLine: false,
      getDrawingVerticalLine: (value) {
        return const FlLine(
          color: AppColors.extraLightGrey,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: const FlTitlesData(
      rightTitles: AxisTitles(),
      topTitles: AxisTitles(),
      leftTitles: AxisTitles(),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 900,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 354),
          FlSpot(2, 226),
          FlSpot(4, 500),
          FlSpot(6, 309),
          FlSpot(8, 454),
          FlSpot(10, 362),
          FlSpot(11, 400),
        ],
        color: AppColors.primary,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
      ),
    ],
    lineTouchData: LineTouchData(
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map((spotIndex) {
          return TouchedSpotIndicatorData(
            const FlLine(strokeWidth: 0),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 8,
                  color: Colors.white,
                  strokeWidth: 3,
                  strokeColor: AppColors.primary,
                );
              },
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: AppColors.primary,
        getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
          return touchedBarSpots.map((barSpot) {
            final flSpot = barSpot;

            return LineTooltipItem(
              '\$${flSpot.y}',
              const TextStyle(
                color: AppColors.white,
              ),
            );
          }).toList();
        },
      ),
    ),
  );
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Section(
      titleSection: l10n.dashboard,
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
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.lastXTrx('week'),
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                r'$3,500.00',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 9,
              ),
              SizedBox(
                height: 156,
                width: double.maxFinite,
                child: LineChart(
                  mainData(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
