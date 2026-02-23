import 'package:personal_expenses/app/common/localdb/localdb.dart';
import 'package:personal_expenses/app/common/models/paginate.model.dart';
import 'package:personal_expenses/app/infrastructure/datasources/local/tables/personal_expense.table.dart';
import 'package:personal_expenses/app/infrastructure/models/personal_expense.model.dart';

class PersonalExpenseLocalDatasource {
  final PersonalExpenseTable _table;
  PersonalExpenseLocalDatasource(LocalDb db) : _table = PersonalExpenseTable(db);

  Future<Map<String, dynamic>> getPagination(PaginateModel request) async {
    return await _table.getPagination(request);
  }

  Future<List<Map<String, dynamic>>> mapAllForSync() async {
    return await _table.getAllForSync();
  }

  Future<Map<String, dynamic>?> getById(String code) async {
    return await _table.getById(code);
  }

  Future<void> deleteAll() async {
    await _table.deleteAll();
  }

  Future<void> deleteWhere({bool? isSync, required bool isDeleted}) async {
    await _table.deleteWhere(
        isSyncRequest: isSync, isDeletedRequest: isDeleted);
  }

  Future<int> delete(String code) async {
    return await _table.delete(code);
  }

  Future<void> insert(PersonalExpenseModel model) async {
    await _table.insert(model);
  }

  Future<void> update(PersonalExpenseModel model) async {
    await _table.update(model);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return await _table.getAll();
  }
}
