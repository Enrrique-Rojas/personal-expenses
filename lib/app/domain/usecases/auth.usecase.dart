import 'package:personal_expenses/app/common/utils/either.dart';
import 'package:personal_expenses/app/domain/entities/auth/auth.entity.dart';
import 'package:personal_expenses/app/domain/errors/failures.dart';
import 'package:personal_expenses/app/domain/repositories/auth.repo.dart';

class AuthUseCase {
  final AuthRepo repository;
  AuthUseCase(this.repository);

  Future<Either<Failure, bool>> execute(AuthEntity request) {
    return repository.login(request);
  }
}