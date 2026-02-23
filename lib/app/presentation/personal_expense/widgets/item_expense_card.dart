import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/presentation/personal_expense/state/expenses.notifier.dart';

class ExpenseItemCard extends HookConsumerWidget {
  const ExpenseItemCard({
    required this.item,
    this.onEdit,
    this.onView,
    this.onDelete,
    super.key,
  });

  final PersonalExpenseEntity item;
  final VoidCallback? onEdit;
  final VoidCallback? onView;
  final VoidCallback? onDelete;

  static const contentPadding = 18.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final expensesNotifier = ref.read(expenseNotifierPod.notifier);

    return Dismissible(
      key: ValueKey(item.code),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete?.call(),
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Icon(Icons.delete, color: Colors.white, size: 28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GestureDetector(
          onTap: onView,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            padding: const EdgeInsets.all(contentPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primaryColor.withAlpha(31),
                      ),
                      child: Icon(
                        _getCategoryIcon(item.category),
                        color: theme.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatDate(item.date),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${item.currency} ${item.amount.toStringAsFixed(2)}",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () async {
                                await expensesNotifier
                                    .updateFavorite(item.code);
                              },
                              child: Icon(
                                (item.isFavorite ?? false)
                                    ? Icons.star
                                    : Icons.star_border,
                                color: (item.isFavorite ?? false)
                                    ? Colors.amber
                                    : Colors.grey,
                              )
                                  .animate(
                                    target: (item.isFavorite ?? false) ? 1 : 0,
                                  )
                                  .scale(
                                    begin: const Offset(1, 1),
                                    end: const Offset(1.3, 1.3),
                                    duration: 200.ms,
                                  )
                                  .then()
                                  .scale(
                                    begin: const Offset(1.3, 1.3),
                                    end: const Offset(1, 1),
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _CategoryBadge(category: item.category),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text("Editar"),
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ).animate().fade(duration: 300.ms).slideX(begin: 0.1),
                  ],
                ),
              ],
            ),
          )
              .animate()
              .fade(duration: 400.ms)
              .slideY(begin: 0.15, end: 0, curve: Curves.easeOut),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'transport':
        return Icons.directions_car;
      case 'shopping':
        return Icons.shopping_bag;
      case 'entertainment':
        return Icons.movie;
      default:
        return Icons.category;
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy • HH:mm').format(date);
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final color = _getCategoryColor(category);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(31),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Colors.orange;
      case 'transport':
        return Colors.blue;
      case 'shopping':
        return Colors.purple;
      case 'entertainment':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}
