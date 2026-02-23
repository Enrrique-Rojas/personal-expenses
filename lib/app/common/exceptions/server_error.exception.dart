import 'package:personal_expenses/app/common/constants/exception.const.dart';
import 'package:personal_expenses/app/common/exceptions/server.exception.dart';

class ServerErrorException extends ServerException {
  ServerErrorException(String message) : super(code: ExceptionConstants.internalServerError, message: message);
}