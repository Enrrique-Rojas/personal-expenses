import 'package:personal_expenses/app/common/models/list.model.dart';
import 'package:personal_expenses/app/common/models/paginate.model.dart';
import 'package:personal_expenses/app/common/models/pagination.model.dart';
import 'package:personal_expenses/app/common/network/dio.client.dart';
import 'package:personal_expenses/app/infrastructure/models/personal_expense.model.dart';

class PersonalExpenseEndpointDatasource {
  String pathBase = '/personal-expenses';
  final DioClient networkClient;
  PersonalExpenseEndpointDatasource({required this.networkClient});

  Future<PaginationModel<PersonalExpenseModel>> getPagination(
      PaginateModel request) async {
    var url =
        "$pathBase/pagination?pageNumber=${request.pageNumber}&pageSize=${request.pageSize}";
    if (request.filter != null) {
      url += "&filter=${request.filter}";
    }
    final Map<String, dynamic> data = await networkClient.get(url);
    var response = PersonalExpenseModel.fromJsonPaginated(data);
    return response;
  }

  Future<ListModel<PersonalExpenseModel>> getAll() async {
    var url ="$pathBase/all";
    final List<dynamic> data = await networkClient.get(url);
    var response = PersonalExpenseModel.fromJsonList(data);
    return ListModel<PersonalExpenseModel>(list: response, totalRecord: response.length);
  }

  Future<PersonalExpenseModel?> getById(String code) async {
    var url = "$pathBase/$code";
    final Map<String, dynamic>? data = await networkClient.get(url);
    if(data == null) return null;
    var response = PersonalExpenseModel.fromJson(data);
    return response;
  }

  Future<void> insert(PersonalExpenseModel model) async {
    var url = pathBase;
    await networkClient.post(url, model.toJson());
  }

  Future<void> update(PersonalExpenseModel model) async {
    var url = "$pathBase/${model.code}";
    await networkClient.put(url, model.toJson());
  }

  Future<void> delete(String code) async {
    var url = "$pathBase/$code";
    await networkClient.delete(url);
  }
}
