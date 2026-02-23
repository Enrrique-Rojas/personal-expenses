import 'package:personal_expenses/app/common/configs/configuration.dart';
import 'package:personal_expenses/app/common/constants/local_storage.const.dart';
import 'package:personal_expenses/app/common/exceptions/bad_request.exception.dart';
import 'package:personal_expenses/app/common/exceptions/server_error.exception.dart';
import 'package:personal_expenses/app/common/network/dio.client.dart';
import 'package:personal_expenses/app/common/utils/either.dart';
import 'package:personal_expenses/app/domain/entities/auth/auth.entity.dart';
import 'package:personal_expenses/app/domain/errors/failures.dart';
import 'package:personal_expenses/app/domain/repositories/auth.repo.dart';
import 'package:personal_expenses/app/infrastructure/datasources/storage/local.storage.dart';

class AuthRepoImpl extends AuthRepo {
  final LocalStorage storage;
  final DioClient dioClient;
  AuthRepoImpl({required this.storage, required this.dioClient});

  @override
  Future<Either<Failure, bool>> login(AuthEntity model) async {
    try {
        if(await saveKeyUser(model)) {
          return const Right(true);
        } else {
          return const Left(AuthFailure("Error no tienes permisos para acceder"));
        }
    } on BadRequestException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerErrorException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure("Error inesperado de conexión"));
    }
  }

  saveKeyUser(AuthEntity model) async {
    final String authUrl =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${Configuration.instrumentationKey}";
    final data = {
      "email": model.email,
      "password": model.password,
      "returnSecureToken": true
    };
    try {
      final response = await dioClient.post(authUrl, data, isAuthCall: true);

      await storage.setStorage(
          LocalStorageConstants.token, response['idToken']);
      await storage.setStorage(
          LocalStorageConstants.username, response['email']);

      return true;
    } catch (e) {
      return false;
    }
  }
}
