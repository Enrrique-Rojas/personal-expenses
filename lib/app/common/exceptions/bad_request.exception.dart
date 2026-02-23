import 'package:personal_expenses/app/common/constants/exception.const.dart';
import 'package:personal_expenses/app/common/exceptions/server.exception.dart';

class BadRequestException extends ServerException {
  BadRequestException(String message) : super(code: ExceptionConstants.badRequest, message: message);
}