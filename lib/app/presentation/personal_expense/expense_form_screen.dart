import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/app/domain/enums.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/presentation/personal_expense/state/expenses.notifier.dart';

class ExpenseForm extends HookConsumerWidget {
  final PersonalExpenseEntity? expense;
  final bool isViewOnly;

  final bool forceCreate;

  const ExpenseForm({
    super.key,
    this.expense,
    this.isViewOnly = false,
    this.forceCreate = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = expense != null && !forceCreate;

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isLoading = useState(false);

    final labelController =
        useTextEditingController(text: expense?.label ?? '');
    final amountController =
        useTextEditingController(text: expense?.amount.toString() ?? '');

    final categoryState = useState<String>(expense?.category ?? 'food');
    final currencyState = useState<String>(expense?.currency ?? 'PEN');
    final dateState = useState<DateTime>(expense?.date ?? DateTime.now());

    final categories = [
      CategoryEnum.food.name,
      CategoryEnum.transport.name,
      CategoryEnum.services.name,
      CategoryEnum.others.name,
    ];

    final currencies = ['PEN', 'USD', 'EUR'];

    Future<void> submitForm() async {
      if (isViewOnly) return;

      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        FocusScope.of(context).unfocus();

        final newExpense = PersonalExpenseEntity(
          code: isEditing
              ? expense!.code
              : DateTime.now().millisecondsSinceEpoch.toString(),
          label: labelController.text.trim(),
          amount: num.parse(amountController.text.trim()),
          currency: currencyState.value,
          date: dateState.value,
          category: categoryState.value,
        );

        final success = await ref
            .read(expenseNotifierPod.notifier)
            .saveExpense(newExpense, isEditing: isEditing);

        isLoading.value = false;

        if (success && context.mounted) {
          context.router.maybePop();
        }
      }
    }

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          isViewOnly ? 'Detalle' : (isEditing ? 'Editar Gasto' : 'Nuevo Gasto'),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: labelController,
                      label: 'Descripción',
                      icon: Icons.description_outlined,
                      enabled: !isViewOnly && !isLoading.value,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            controller: amountController,
                            label: 'Monto',
                            icon: Icons.attach_money,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            enabled: !isViewOnly && !isLoading.value,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: currencyState.value,
                            decoration: _modernInputDecoration('Moneda'),
                            items: currencies
                                .map((cur) => DropdownMenuItem(
                                      value: cur,
                                      child: Text(cur),
                                    ))
                                .toList(),
                            onChanged: isViewOnly || isLoading.value
                                ? null
                                : (val) => currencyState.value = val ?? 'PEN',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      initialValue: categoryState.value,
                      decoration: _modernInputDecoration(
                        'Categoría',
                        icon: Icons.category_outlined,
                      ),
                      items: categories
                          .map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(cat.toUpperCase()),
                              ))
                          .toList(),
                      onChanged: isViewOnly || isLoading.value
                          ? null
                          : (val) => categoryState.value = val ?? 'food',
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: isViewOnly || isLoading.value
                          ? null
                          : () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: dateState.value,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                dateState.value = pickedDate;
                              }
                            },
                      child: InputDecorator(
                        decoration: _modernInputDecoration(
                          'Fecha',
                          icon: Icons.calendar_today,
                        ),
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(dateState.value),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
              const SizedBox(height: 40),
              if (!isViewOnly)
                FilledButton(
                  onPressed: isLoading.value ? null : submitForm,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: isLoading.value
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          isEditing ? 'Guardar Cambios' : 'Crear Gasto',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                )
                    .animate()
                    .fade(delay: 200.ms)
                    .scale(begin: const Offset(0.9, 0.9)),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _modernInputDecoration(
    String label, {
    IconData? icon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon) : null,
      filled: true,
      fillColor: const Color(0xfff7f8fa),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(width: 1.2),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool enabled,
    IconData? icon,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Campo requerido';
        }
        return null;
      },
      decoration: _modernInputDecoration(label, icon: icon),
    );
  }
}
