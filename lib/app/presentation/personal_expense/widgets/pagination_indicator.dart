import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_expenses/app/presentation/personal_expense/state/expenses.notifier.dart';

class PaginationIndicator extends ConsumerWidget {
  const PaginationIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(expenseNotifierPod).map(
            loading: (_) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator.adaptive(),
                  SizedBox(height: 10),
                  Text('Cargando más...', textAlign: TextAlign.center),
                ],
              ),
            ),
            loaded: (s) {
              if (s.canLoadMore) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => ref.read(expenseNotifierPod.notifier).loadExpenses(),
                );
              }
              return const SizedBox.shrink();
            },
            failure: (s) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(s.errorMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Reintentar'),
                    onPressed: () =>
                        ref.read(expenseNotifierPod.notifier).loadExpenses(),
                  ),
                ],
              ),
            ),
          );
}
