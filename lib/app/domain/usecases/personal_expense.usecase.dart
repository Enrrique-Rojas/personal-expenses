import 'package:personal_expenses/app/common/models/list.model.dart';
import 'package:personal_expenses/app/common/models/paginate.model.dart';
import 'package:personal_expenses/app/common/models/pagination.model.dart';
import 'package:personal_expenses/app/common/utils/either.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/domain/errors/failures.dart';
import 'package:personal_expenses/app/domain/repositories/personal_expense.repo.dart';

class PersonalExpenseSaveUseCase {
  final PersonalExpenseRepo repository;

  PersonalExpenseSaveUseCase(this.repository);

  Future<Either<Failure, void>> execute(
      PersonalExpenseEntity request, bool isNew) {
    return repository.save(request, isNew);
  }
}

class PersonalExpenseGetByIdUseCase {
  final PersonalExpenseRepo repository;

  PersonalExpenseGetByIdUseCase(this.repository);

  Future<Either<Failure, PersonalExpenseEntity?>> execute(String code) {
    return repository.getById(code);
  }
}

class PersonalExpenseGetPaginationUseCase {
  final PersonalExpenseRepo repository;

  PersonalExpenseGetPaginationUseCase(this.repository);

  Future<Either<Failure, PaginationModel<PersonalExpenseEntity>>> execute(
      PaginateModel request) {
    return repository.getPagination(request);
  }
}

class PersonalExpenseGetAllUseCase {
  final PersonalExpenseRepo repository;

  PersonalExpenseGetAllUseCase(this.repository);

  Future<Either<Failure, ListModel<PersonalExpenseEntity>>> execute() {
    return repository.getAll();
  }
}

class PersonalExpenseDeleteUseCase {
  final PersonalExpenseRepo repository;

  PersonalExpenseDeleteUseCase(this.repository);

  Future<Either<Failure, bool>> execute(String code) {
    return repository.delete(code);
  }
}

class PersonalExpenseFavoriteUseCase {
  final PersonalExpenseRepo repository;

  PersonalExpenseFavoriteUseCase(this.repository);

  Future<Either<Failure, bool>> execute(String code) {
    return repository.favorite(code);
  }
}

class PersonalExpenseSyncUseCase {
  final PersonalExpenseRepo repository;

  PersonalExpenseSyncUseCase(this.repository);

  Future<Either<Failure, bool>> execute() {
    return repository.sync();
  }
}
