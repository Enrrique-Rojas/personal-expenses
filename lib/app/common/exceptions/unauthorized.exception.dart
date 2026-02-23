import 'package:personal_expenses/app/common/constants/exception.const.dart';
import 'package:personal_expenses/app/common/exceptions/server.exception.dart';


class UnauthorisedException extends ServerException {
  UnauthorisedException(String message) : super(code: ExceptionConstants.internalServerError, message: message);
}
