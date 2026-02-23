import 'package:package_info_plus/package_info_plus.dart';
import 'package:personal_expenses/app/common/constants/common.const.dart';
import 'package:personal_expenses/app/infrastructure/datasources/local/tables/personal_expense.table.dart';
import 'package:personal_expenses/app/infrastructure/datasources/storage/local.storage.dart';
import 'package:sqflite/sqflite.dart';

class DbSqfLiteUtil {
  static Future<Database> instance({required LocalStorage localStorage}) async {
    final info = await PackageInfo.fromPlatform();
    var databasePath = await CommonConstants.directory();
    String path = "$databasePath/PEX_DB_${info.version}.db";
    var db =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await Future.wait([
        ..._common(db, localStorage)
      ]);
    });
    return db;
  }

  static List<Future<void>> _common(Database db, LocalStorage localStorage) {
    return [
      localStorage.resetDataLocalStore(),
      PersonalExpenseTable.createTable(db),
    ];
  }
}
