import 'package:personal_expenses/app/common/utils/either.dart';
import 'package:personal_expenses/app/domain/entities/auth/auth.entity.dart';
import 'package:personal_expenses/app/domain/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> login(AuthEntity model);
}