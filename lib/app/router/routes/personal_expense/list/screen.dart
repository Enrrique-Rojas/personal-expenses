import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/app/presentation/personal_expense/expenses_screen.dart';

@RoutePage(name: 'ExpensesListRoute')
class ExpensesListScreen extends StatelessWidget {
  const ExpensesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ExpensesScreen());
  }
}
