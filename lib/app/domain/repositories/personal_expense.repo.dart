import 'package:personal_expenses/app/common/models/list.model.dart';
import 'package:personal_expenses/app/common/models/paginate.model.dart';
import 'package:personal_expenses/app/common/models/pagination.model.dart';
import 'package:personal_expenses/app/common/utils/either.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/domain/errors/failures.dart';

abstract class PersonalExpenseRepo {
  Future<Either<Failure, void>> save(PersonalExpenseEntity request, bool isNew);
  Future<Either<Failure, bool>> favorite(String code);
  Future<Either<Failure, PersonalExpenseEntity?>> getById(String code);
  Future<Either<Failure, PaginationModel<PersonalExpenseEntity>>> getPagination(PaginateModel request);
  Future<Either<Failure, ListModel<PersonalExpenseEntity>>> getAll();
  Future<Either<Failure, bool>> delete(String code);
  Future<Either<Failure, bool>> sync();
}