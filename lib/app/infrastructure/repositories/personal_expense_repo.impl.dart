import 'package:personal_expenses/app/common/constants/local_storage.const.dart';
import 'package:personal_expenses/app/common/models/list.model.dart';
import 'package:personal_expenses/app/common/models/paginate.model.dart';
import 'package:personal_expenses/app/common/models/pagination.model.dart';
import 'package:personal_expenses/app/common/utils/either.dart';
import 'package:personal_expenses/app/common/utils/internet.util.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/domain/errors/failures.dart';
import 'package:personal_expenses/app/domain/repositories/personal_expense.repo.dart';
import 'package:personal_expenses/app/infrastructure/datasources/local/personal_expense_local.datasource.dart';
import 'package:personal_expenses/app/infrastructure/datasources/services/personal_expense_firebase.datasource.dart';
import 'package:personal_expenses/app/infrastructure/datasources/storage/local.storage.dart';
import 'package:personal_expenses/app/infrastructure/models/personal_expense.model.dart';

class PersonalExpenseRepoImpl extends PersonalExpenseRepo {
  final PersonalExpenseFirestoreDatasource personalExpenseFirestoreDatasource;
  final PersonalExpenseLocalDatasource personalExpenseLocalDatasource;
  final LocalStorage storage;

  PersonalExpenseRepoImpl(this.personalExpenseFirestoreDatasource,
      this.personalExpenseLocalDatasource, this.storage);

  @override
  Future<Either<Failure, bool>> delete(String code) async {
    try {
      final response = await personalExpenseLocalDatasource.getById(code);
      if (response == null) {
        return const Left(DatabaseFailure("Gasto no encontrado"));
      }

      final internetIsActive = await InternetUtil.internetIsActive();
      final username = await storage.getStorage(LocalStorageConstants.username);
      final now = DateTime.now();

      var model = PersonalExpenseModel.fromJson(response)
          .copyWith(lastModified: now, lastModifiedBy: username);

      if (internetIsActive) {
        await personalExpenseFirestoreDatasource.delete(code);
        await personalExpenseLocalDatasource.delete(code);
      } else {
        await personalExpenseLocalDatasource
            .update(model.copyWith(isDeleted: true, isSync: false));
      }
      return const Right(true);
    } catch (e) {
      return Left(DatabaseFailure("Error al eliminar: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, PersonalExpenseEntity?>> getById(String code) async {
    try {
      var response = await personalExpenseLocalDatasource.getById(code);
      if (response == null) return const Right(null);
      return Right(PersonalExpenseEntity.fromJson(response));
    } catch (e) {
      return Left(DatabaseFailure("Error al obtener dato local"));
    }
  }

  @override
  Future<Either<Failure, ListModel<PersonalExpenseEntity>>> getAll() async {
    try {
      var response = await personalExpenseLocalDatasource.getAll();
      var list =
          response.map((e) => PersonalExpenseEntity.fromJson(e)).toList();
      return Right(ListModel<PersonalExpenseEntity>(
          list: list, totalRecord: list.length));
    } catch (e) {
      return const Left(DatabaseFailure("Error al listar gastos"));
    }
  }

  @override
  Future<Either<Failure, PaginationModel<PersonalExpenseEntity>>> getPagination(
      PaginateModel request) async {
    try {
      var jsonMap = await personalExpenseLocalDatasource.getPagination(request);
      var pagination = PersonalExpenseModel.fromJsonPaginated(jsonMap);
      var list = pagination.list
          .map((e) => PersonalExpenseEntity(
              code: e.code,
              category: e.category ?? "",
              date: e.date ?? DateTime.now(),
              currency: e.currency ?? "PEN",
              amount: e.amount ?? 0.0,
              label: e.label ?? "",
              isFavorite: e.isFavorite))
          .toList();

      return Right(PaginationModel(
          pageNumber: pagination.pageNumber,
          pageSize: pagination.pageSize,
          totalRecord: pagination.totalRecord,
          list: list));
    } catch (e) {
      return const Left(DatabaseFailure("Error en paginación local"));
    }
  }

  @override
  Future<Either<Failure, bool>> save(
      PersonalExpenseEntity request, bool isNew) async {
    try {
      final internetIsActive = await InternetUtil.internetIsActive();
      final username = await storage.getStorage(LocalStorageConstants.username);
      final now = DateTime.now();

      if (isNew) {
        if (internetIsActive) {
          await personalExpenseFirestoreDatasource.insert(
              PersonalExpenseModel.castFromEntity(request)
                  .copyWith(createdBy: username, created: now));
        }
        await personalExpenseLocalDatasource.insert(
            PersonalExpenseModel.castFromEntity(request).copyWith(
                createdBy: username,
                created: now,
                isSync: internetIsActive,
                isFavorite: false,
                isDeleted: false));
      } else {
        final response =
            await personalExpenseLocalDatasource.getById(request.code);
        if (response == null) {
          return const Left(
              DatabaseFailure("No se encontró el registro para actualizar"));
        }

        var model = PersonalExpenseModel.fromJson(response);
        if (internetIsActive) {
          await personalExpenseFirestoreDatasource.update(
              PersonalExpenseModel.castFromEntity(request)
                  .copyWith(lastModifiedBy: username, lastModified: now));
        }

        await personalExpenseLocalDatasource.update(
            PersonalExpenseModel.castFromEntity(request).copyWith(
                lastModifiedBy: username,
                lastModified: now,
                isSync: internetIsActive,
                isFavorite: model.isFavorite,
                created: model.created,
                createdBy: model.createdBy,
                isDeleted: model.isDeleted));
      }
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure("Error al guardar: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, bool>> sync() async {
    try {
      final internetIsActive = await InternetUtil.internetIsActive();
      if (!internetIsActive) {
        return const Left(ServerFailure("No hay conexión a internet"));
      }

      final list = await personalExpenseLocalDatasource.mapAllForSync();

      for (var element in list) {
        var model = PersonalExpenseModel.fromJson(element);
        if (model.isDeleted) {
          await personalExpenseFirestoreDatasource.delete(model.code);
          await personalExpenseLocalDatasource.delete(model.code);
        } else {
          try {
            var response =
                await personalExpenseFirestoreDatasource.getById(model.code);
            if (response == null) {
              await personalExpenseFirestoreDatasource.insert(model);
            } else {
              await personalExpenseFirestoreDatasource.update(model);
            }
          } catch (e) {
            await personalExpenseFirestoreDatasource.insert(model);
          }
          await personalExpenseLocalDatasource
              .update(model.copyWith(isSync: true));
        }
      }
      return const Right(true);
    } catch (e) {
      return const Left(ServerFailure("Fallo crítico en la sincronización"));
    }
  }

  @override
  Future<Either<Failure, bool>> favorite(String code) async {
    try {
      final response = await personalExpenseLocalDatasource.getById(code);
      if (response == null) {
        return const Left(DatabaseFailure("Gasto no encontrado"));
      }

      var model = PersonalExpenseModel.fromJson(response);
      var modelFavorite = model.copyWith(isFavorite: !model.isFavorite);

      await personalExpenseLocalDatasource.update(modelFavorite);
      return const Right(true);
    } catch (e) {
      return const Left(DatabaseFailure("No se pudo marcar como favorito"));
    }
  }
}
