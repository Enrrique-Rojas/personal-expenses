import 'package:personal_expenses/app/common/constants/common.const.dart';
import 'package:personal_expenses/app/common/localdb/localdb.dart';
import 'package:personal_expenses/app/common/models/paginate.model.dart';
import 'package:personal_expenses/app/infrastructure/models/personal_expense.model.dart';
import 'package:sqflite/sqflite.dart';

class PersonalExpenseTable {
  static const _table = Tables.personalExpense;
  static const String code = "code";
  static const String category = "category";
  static const String date = "date";
  static const String currency = "currency";
  static const String amount = "amount";
  static const String label = "label";
  static const String isFavorite = "isFavorite";
  static const String isDeleted = "isDeleted";
  static const String isSync = "isSync";
  static const String createdBy = "createdBy";
  static const String created = "created";
  static const String lastModifiedBy = "lastModifiedBy";
  static const String lastModified = "lastModified";

  late List<String> _columns;
  late LocalDb _db;
  PersonalExpenseTable(LocalDb db) {
    _db = db;
    _columns = [
      code,
      category,
      date,
      currency,
      amount,
      label,
      isFavorite,
      isDeleted,
      isSync,
      createdBy,
      created,
      lastModifiedBy,
      lastModified
    ];
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return await _db.query(_table,
        columns: _columns, where: '$isDeleted = ?', whereArgs: [0]);
  }

  Future<List<Map<String, dynamic>>> getAllForSync() async {
    return await _db.query(_table,
        columns: _columns,
        where: '$isDeleted = ? OR $isSync = ?',
        whereArgs: [1, 0]);
  }

  Future<int> count() async {
    return await _db.firstIntValue(
            await _db.rawQuery("SELECT COUNT(1) FROM $_table;")) ??
        0;
  }

  Future<Map<String, dynamic>> getPagination(PaginateModel request) async {
    List<Map<String, dynamic>> maps;
    int totalRecords = await count();

    if (request.filter == null || request.filter!.isEmpty) {
      maps = await _db.query(
        _table,
        columns: _columns,
        offset: (request.pageNumber - 1) * request.pageSize,
        limit: request.pageSize,
      );
    } else {
      var query = """
        SELECT * FROM $_table 
        WHERE $label LIKE ?
        AND $isDeleted = 0 
        LIMIT ? OFFSET ?
      """;
      maps = await _db.rawQuery(query,
          ['%${request.filter!.trim()}%', request.pageSize, request.offset]);
    }

    return {
      'list': maps,
      'totalRecord': totalRecords,
      'pageNumber': request.pageNumber,
      'pageSize': request.pageSize
    };
  }

  Future<Map<String, dynamic>?> getById(String codeValue) async {
    var query = await _db.query(
      _table,
      columns: _columns,
      where: '$code = ?',
      whereArgs: [codeValue],
    );
    return query.isNotEmpty ? query.first : null;
  }

  Future<void> insert(PersonalExpenseModel model) async {
    final batch = _db.batch();
    batch.insert(_table, model.toMapTable());
    await batch.commit();
  }

  Future<void> update(PersonalExpenseModel model) async {
    final batch = _db.batch();
    batch.update(
      _table,
      model.toMapTable(),
      where: '$code = ?',
      whereArgs: [model.code],
    );
    await batch.commit();
  }

  Future<void> deleteAll() async {
    var batch = _db.batch();
    batch.delete(_table);
    await batch.commit();
  }

  Future<void> deleteWhere(
      {bool? isSyncRequest, bool? isDeletedRequest}) async {
    final conditions = <String>[];
    final args = <dynamic>[];

    if (isSyncRequest != null) {
      conditions.add('$isSync = ?');
      args.add(isSyncRequest ? 1 : 0);
    }
    if (isDeletedRequest != null) {
      conditions.add('$isDeleted = ?');
      args.add(isDeletedRequest ? 1 : 0);
    }
    await _db.delete(
      _table,
      where: conditions.isEmpty ? null : conditions.join(' AND '),
      whereArgs: conditions.isEmpty ? null : args,
    );
  }

  Future<int> delete(String codeValue) async {
    return await _db.delete(_table, where: '$code = ?', whereArgs: [codeValue]);
  }

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $_table(
        $code varchar(50),
        $category varchar(50),
        $date datetime,
        $currency varchar(3),
        $amount real,
        $label varchar(1000),
        $isFavorite integer,
        $isDeleted integer,
        $isSync integer,
        $createdBy varchar(50),
        $created datetime,
        $lastModifiedBy varchar(50) NULL,
        $lastModified datetime NULL
      )
    ''');
  }
}
