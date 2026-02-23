import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/presentation/personal_expense/expense_form_screen.dart';

@RoutePage(name: 'ExpenseFormRoute')
class ExpenseFormScreen extends StatelessWidget {
  const ExpenseFormScreen({super.key, this.expense, this.isViewOnly = false, this.forceCreate = false});

  final PersonalExpenseEntity? expense;
  final bool isViewOnly;
  final bool forceCreate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExpenseForm(expense: expense, isViewOnly: isViewOnly, forceCreate: forceCreate,));
  }
}
