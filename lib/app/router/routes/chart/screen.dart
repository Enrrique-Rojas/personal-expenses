import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/app/presentation/chart/chart_items.dart';

@RoutePage(name: 'ChartRoute')
class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const ChartItems()),
    );
  }
}
