import 'dart:async';

import 'package:personal_expenses/app/common/models/list.model.dart';
import 'package:personal_expenses/app/common/network/dio.client.dart';
import 'package:personal_expenses/app/infrastructure/models/personal_expense.model.dart';

class PersonalExpenseFirestoreDatasource {
  final String collection = 'personal-expenses';
  final DioClient networkClient;

  PersonalExpenseFirestoreDatasource({required this.networkClient});

  Future<ListModel<PersonalExpenseModel>> getAll() async {
    final String url = '/$collection';
    final Map<String, dynamic> response = await networkClient.get(url);
    final List<dynamic>? docs = response['documents'];
    if (docs == null) return ListModel(list: [], totalRecord: 0);

    final list = docs.map((doc) {
      return PersonalExpenseModel.fromFirestoreRest(doc);
    }).toList();

    return ListModel<PersonalExpenseModel>(
        list: list, totalRecord: list.length);
  }

  Future<PersonalExpenseModel?> getById(String code) async {
    final String url = '/$collection/$code';
    try {
      final Map<String, dynamic> data = await networkClient.get(url);
      return PersonalExpenseModel.fromFirestoreRest(data);
    } catch (e) {
      return null;
    }
  }

  Future<void> insert(PersonalExpenseModel model) async {
    final String url = '/$collection?documentId=${model.code}';
    await networkClient.post(url, model.toFirestoreRestJson());
  }

  Future<void> update(PersonalExpenseModel model) async {
    final String url = '/$collection/${model.code}';
    await networkClient.patch(url, model.toFirestoreRestJson());
  }

  Future<void> delete(String code) async {
    final String url = '/$collection/$code';
    await networkClient.delete(url);
  }
}
