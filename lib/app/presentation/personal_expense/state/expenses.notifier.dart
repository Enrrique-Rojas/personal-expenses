import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_expenses/app/common/constants/common.const.dart';
import 'package:personal_expenses/app/common/injector/injector.dart';
import 'package:personal_expenses/app/common/models/paginate.model.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/domain/usecases/personal_expense.usecase.dart';

part 'expenses.notifier.freezed.dart';
part 'expenses.state.dart';

class ExpensesNotifier extends StateNotifier<ExpensesState> {
  final PersonalExpenseGetByIdUseCase getUseCase;
  final PersonalExpenseDeleteUseCase deleteUseCase;
  final PersonalExpenseFavoriteUseCase favoriteUseCase;
  final PersonalExpenseGetAllUseCase getAllUseCase;
  final PersonalExpenseGetPaginationUseCase getPaginationUseCase;
  final PersonalExpenseSaveUseCase saveUseCase;
  final PersonalExpenseSyncUseCase syncUseCase;

  ExpensesNotifier(
      this.getUseCase,
      this.deleteUseCase,
      this.favoriteUseCase,
      this.getAllUseCase,
      this.getPaginationUseCase,
      this.saveUseCase,
      this.syncUseCase)
      : super(ExpensesState.loaded(canLoadMore: true, items: []));

  Future<void> loadExpenses() async {
    if (state is _ExpensesLoading) return;
    if (!state.canLoadMore) return;

    state = ExpensesState.loading(
      canLoadMore: state.canLoadMore,
      items: state.items,
    );

    final paginateModel =
        PaginateModel(pageNumber: 1, pageSize: CommonConstants.pageSizeDefault);

    final result = await getPaginationUseCase.execute(paginateModel);

    if (!mounted) return;

    result.fold(
      (failure) {
        state = ExpensesState.failure(
          canLoadMore: state.canLoadMore,
          items: state.items,
          errorMessage: failure.message,
        );
      },
      (pagination) {
        final newItems = pagination.list;
        final existingIds = state.items.map((e) => e.code).toSet();
        final filteredNewItems =
            newItems.where((e) => !existingIds.contains(e.code)).toList();
        final allItems = [...state.items, ...filteredNewItems];

        state = ExpensesState.loaded(
          canLoadMore: filteredNewItems.isNotEmpty,
          items: allItems,
        );
      },
    );
  }

  Future<bool> saveExpense(PersonalExpenseEntity expense,
      {required bool isEditing}) async {
    final result = await saveUseCase.execute(expense, !isEditing);

    return result.fold(
      (failure) => false,
      (success) async {
        await reloadExpensesItems();
        return true;
      },
    );
  }

  Future<void> reloadExpensesItems() async {
    if (state is _ExpensesLoading) return;
    state = const ExpensesState.loaded(
      canLoadMore: true,
      items: [],
    );
    await loadExpenses();
  }

  Future<void> updateFavorite(String code) async {
    final result = await favoriteUseCase.execute(code);

    if (!mounted) return;

    result.fold(
      (failure) {},
      (success) async {
        await reloadExpensesItems();
      },
    );
  }

  Future<void> deleteExpense(String code) async {
    final result = await deleteUseCase.execute(code);

    if (!mounted) return;
    result.fold(
      (failure) {},
      (success) async {
        await reloadExpensesItems();
      },
    );
  }

  Future<void> syncExpenses() async {
    final result = await syncUseCase.execute();

    if (!mounted) return;
    result.fold(
      (failure) {},
      (success) async {
        await reloadExpensesItems();
      },
    );
  }
}

final expenseNotifierPod =
    StateNotifierProvider<ExpensesNotifier, ExpensesState>(
  (ref) {
    return Injector.resolve<ExpensesNotifier>();
  },
);
