import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_expenses/app/presentation/personal_expense/state/expenses.notifier.dart';

class ChartItems extends HookConsumerWidget {
  const ChartItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesState = ref.watch(expenseNotifierPod);
    final items = expensesState.items;

    final categories = items.map((e) => e.category).toSet().toList();
    final data = categories.map((cat) {
      final total = items
          .where((e) => e.category == cat)
          .fold<num>(0, (sum, e) => sum + e.amount);
      return BarChartRodData(
          toY: total.toDouble(), color: const Color(0xFF2196F3));
    }).toList();

    final chartType = useState(0);

    Widget barChart() => BarChart(
          BarChartData(
            barGroups: List.generate(
                categories.length,
                (i) => BarChartGroupData(
                    x: i, barRods: [data[i]], showingTooltipIndicators: [0])),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    final idx = value.toInt();
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(categories[idx],
                          style: const TextStyle(fontSize: 12)),
                    );
                  },
                ),
              ),
            ),
          ),
        );

    Widget pieChart() => PieChart(
          PieChartData(
            sections: List.generate(categories.length, (i) {
              final total = items
                  .where((e) => e.category == categories[i])
                  .fold<num>(0, (sum, e) => sum + e.amount);
              return PieChartSectionData(
                value: total.toDouble(),
                title: categories[i],
                color: Colors.primaries[i % Colors.primaries.length],
                radius: 60,
                titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              );
            }),
          ),
        );

    return Scaffold(
      appBar: AppBar(title: const Text('Reportes de gastos')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => chartType.value = 0,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: chartType.value == 0
                        ? Colors.blue
                        : Colors.grey.shade300,
                  ),
                  child: const Text('Barras'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => chartType.value = 1,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: chartType.value == 1
                        ? Colors.blue
                        : Colors.grey.shade300,
                  ),
                  child: const Text('Pastel'),
                ),
              ],
            ),
            const SizedBox(height: 44),
            Expanded(
                child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: chartType.value == 0 ? barChart() : pieChart(),
            )),
          ],
        ),
      ),
    );
  }
}
