import 'package:dio/dio.dart';
import 'package:personal_expenses/app/common/constants/exception.const.dart';
import 'package:personal_expenses/app/common/exceptions/bad_request.exception.dart';
import 'package:personal_expenses/app/common/exceptions/server_error.exception.dart';
import 'package:personal_expenses/app/common/exceptions/unauthorized.exception.dart';

class DioUtil {
  static dynamic getDioResponse(Response response) {
    if (response.statusCode == 204) return null;
    return response.data;
  }

  static dynamic handleDioError(DioException e) {
    final response = e.response;
    if (response == null) throw Exception("Error de conexión");

    final responseData = response.data;

    switch (response.statusCode) {
      case 400:
        throw BadRequestException(getErrorResult(responseData));
      case 401:
        throw UnauthorisedException(responseData);
      case 500:
      default:
        throw ServerErrorException(getErrorResult(responseData));
    }
  }

  static String getErrorResult(dynamic result) {
    if (result['errors'] is Map) {
      return result['errors'];
    } else if (result['message'] is String) {
      return result['message'];
    } else {
      return ExceptionConstants.somethingWentWrong;
    }
  }
}
