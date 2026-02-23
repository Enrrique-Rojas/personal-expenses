import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/presentation/personal_expense/widgets/app_bar.dart';
import 'package:personal_expenses/app/presentation/personal_expense/widgets/item_expense_card.dart';
import 'package:personal_expenses/app/presentation/personal_expense/widgets/pagination_indicator.dart';
import 'package:personal_expenses/app/presentation/personal_expense/state/expenses.notifier.dart';
import 'package:personal_expenses/app/router/app_router.gr.dart';

class ExpensesScreen extends HookConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesState = ref.watch(expenseNotifierPod);
    final items = expensesState.items;

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(expenseNotifierPod.notifier).reloadExpensesItems();
        });
        return null;
      },
      [],
    );

    return Scaffold(
      appBar: AppBarExpenses(),
      body: Builder(
        builder: (context) {
          if (items.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () =>
                  ref.read(expenseNotifierPod.notifier).reloadExpensesItems(),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 16, bottom: 80),
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index == items.length) {
                    return const PaginationIndicator();
                  }

                  final item = items[index];

                  return ExpenseItemCard(
                    key: ValueKey(item.code),
                    item: item,
                    onDelete: () async {
                      await ref
                          .read(expenseNotifierPod.notifier)
                          .deleteExpense(item.code);
                    },
                    onView: () =>
                        _showAction(context, "Viendo", item.label, item),
                    onEdit: () =>
                        _showAction(context, "Editando", item.label, item),
                  )
                      .animate()
                      .fade(delay: (index * 80).ms)
                      .slideY(begin: 0.2, end: 0);
                },
              ),
            );
          }

          return expensesState.map(
            loading: (_) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            loaded: (s) => const Center(
              child: Text(
                'No hay gastos registrados',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            failure: (s) => Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(s.errorMessage, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref
                          .read(expenseNotifierPod.notifier)
                          .reloadExpensesItems(),
                      child: const Text('Reintentar'),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.router.push(ExpenseFormRoute());
        },
        icon: const Icon(Icons.add),
        label: const Text("Nuevo Gasto"),
      ),
    );
  }

  void _showAction(BuildContext context, String action, String label,
      PersonalExpenseEntity item) {
    context.router.push(ExpenseFormRoute(
      expense: item,
      isViewOnly: action == 'Viendo' ? true : false,
    ));
  }
}
