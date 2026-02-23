import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:personal_expenses/app/common/constants/local_storage.const.dart';
import 'package:personal_expenses/app/common/utils/convert.util.dart';

class LocalStorage {
  static late FlutterSecureStorage _storage;

  LocalStorage() {
    _storage = const FlutterSecureStorage();
  }

  LocalStorage resolve() => LocalStorage();

  Future<void> setStorage(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getStorage(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteStorage(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAllStorage() async {
    await _storage.deleteAll();
  }

  Future<void> removeSesion() async {
    await Future.wait([
      _storage.delete(key: LocalStorageConstants.username),
      _storage.delete(key: LocalStorageConstants.token),
      _storage.delete(key: LocalStorageConstants.tokenExpirate),
      _storage.delete(key: LocalStorageConstants.username),
      _storage.delete(key: LocalStorageConstants.isOnline),
    ]);
  }

  Future<void> resetDataLocalStore() async {
    await Future.wait([
      _storage.delete(key: LocalStorageConstants.listExpensesIsSync),
    ]);
  }

  Future<bool> dataBaseIsSync() async {
    var responses = await Future.wait(
        [_storage.read(key: LocalStorageConstants.listExpensesIsSync)]);
    var listExpensesIsSync = ConvertUtil.toBool(responses[0]);

    return listExpensesIsSync;
  }
}
