import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb {
  Database db;
  LocalDb({required this.db});

  Future<List<Map<String, Object?>>> query(String table,
      {List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      int? offset,
      int? limit,
      String? orderBy}) async {
    return await db
        .query(table,
            columns: columns, where: where, whereArgs: whereArgs, offset: offset, limit: limit, orderBy: orderBy)
        .catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e;
    });
  }

  Future<int?> firstIntValue(List<Map<String, Object?>> list) async {
    return Sqflite.firstIntValue(list);
  }

  Future<List<Map<String, Object?>>> rawQuery(String sql, [List<Object?>? arguments]) async {
    if (kDebugMode) {
      print("======= rawQuery (sql) =========== \n$sql");
    }
    return await db.rawQuery(sql, arguments).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e;
    });
  }

  Batch batch() {
    return db.batch();
  }

  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    if (kDebugMode) {
      print("======= execute (sql) =========== \n$values");
    }
    return await db
        .insert(table, values, nullColumnHack: nullColumnHack, conflictAlgorithm: conflictAlgorithm)
        .catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e;
    });
  }

  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    if (kDebugMode) {
      print("======= execute (sql) =========== \n$values");
    }
    return await db
        .update(table, values, where: where, whereArgs: whereArgs, conflictAlgorithm: conflictAlgorithm)
        .catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e;
    });
  }

  Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    return await db.delete(table, where: where, whereArgs: whereArgs).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e;
    });
  }

  Future<void> execute(String sql, [List<Object?>? arguments]) async {
    if (kDebugMode) {
      print("======= execute (sql) =========== \n$sql");
    }
    return await db.execute(sql, arguments).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e;
    });
  }
}
