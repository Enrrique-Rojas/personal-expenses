part of 'expenses.notifier.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState.loading({
    required bool canLoadMore,
    required List<PersonalExpenseEntity> items,
  }) = _ExpensesLoading;

  const factory ExpensesState.loaded({
    required bool canLoadMore,
    required List<PersonalExpenseEntity> items,
  }) = _ExpensesLoaded;

  const factory ExpensesState.failure({
    required bool canLoadMore,
    required List<PersonalExpenseEntity> items,
    required String errorMessage,
  }) = _ExpensesFailure;
}
