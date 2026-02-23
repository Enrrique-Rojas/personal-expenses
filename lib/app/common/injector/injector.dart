import 'package:get_it/get_it.dart';
import 'package:personal_expenses/app/common/localdb/localdb.dart';
import 'package:personal_expenses/app/common/network/dio.client.dart';
import 'package:personal_expenses/app/common/utils/dbsqflite.util.dart';
import 'package:personal_expenses/app/domain/repositories/auth.repo.dart';
import 'package:personal_expenses/app/domain/repositories/personal_expense.repo.dart';
import 'package:personal_expenses/app/domain/usecases/auth.usecase.dart';
import 'package:personal_expenses/app/domain/usecases/personal_expense.usecase.dart';
import 'package:personal_expenses/app/infrastructure/datasources/endpoints/personal_expense.datasource.dart';
import 'package:personal_expenses/app/infrastructure/datasources/local/personal_expense_local.datasource.dart';
import 'package:personal_expenses/app/infrastructure/datasources/services/personal_expense_firebase.datasource.dart';
import 'package:personal_expenses/app/infrastructure/datasources/storage/local.storage.dart';
import 'package:personal_expenses/app/infrastructure/repositories/auth_repo.impl.dart';
import 'package:personal_expenses/app/infrastructure/repositories/personal_expense_repo.impl.dart';
import 'package:personal_expenses/app/presentation/login/state/auth.notifier.dart';
import 'package:personal_expenses/app/presentation/personal_expense/state/expenses.notifier.dart';

final injector = GetIt.instance;

abstract class Injector {
  static Future<void> setup() async {
    // STORAGE
    final storage = LocalStorage();
    injector.registerSingleton<LocalStorage>(storage);

    // DATABASE
    final dbInstance = await DbSqfLiteUtil.instance(localStorage: storage);

    injector.registerSingleton<LocalDb>(
      LocalDb(db: dbInstance),
    );

    // NETWORK
    injector.registerLazySingleton<DioClient>(
      () => DioClient(storage: injector()),
    );

    // DATASOURCES
    injector.registerLazySingleton<PersonalExpenseEndpointDatasource>(
      () => PersonalExpenseEndpointDatasource(networkClient: injector()),
    );

    injector.registerLazySingleton<PersonalExpenseFirestoreDatasource>(
      () => PersonalExpenseFirestoreDatasource(networkClient: injector()),
    );

    injector.registerLazySingleton<PersonalExpenseLocalDatasource>(
      () => PersonalExpenseLocalDatasource(injector()),
    );

    // REPOSITORIES
    injector.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(storage: injector(), dioClient: injector()),
    );

    injector.registerLazySingleton<PersonalExpenseRepo>(
      () => PersonalExpenseRepoImpl(injector(), injector(), injector()),
    );

    // USECASES
    injector.registerLazySingleton<AuthUseCase>(
      () => AuthUseCase(injector()),
    );

    injector.registerLazySingleton<PersonalExpenseSaveUseCase>(
      () => PersonalExpenseSaveUseCase(injector()),
    );

    injector.registerLazySingleton<PersonalExpenseDeleteUseCase>(
      () => PersonalExpenseDeleteUseCase(injector()),
    );

    injector.registerLazySingleton<PersonalExpenseFavoriteUseCase>(
      () => PersonalExpenseFavoriteUseCase(injector()),
    );

    injector.registerLazySingleton<PersonalExpenseGetByIdUseCase>(
      () => PersonalExpenseGetByIdUseCase(injector()),
    );

    injector.registerLazySingleton<PersonalExpenseGetPaginationUseCase>(
      () => PersonalExpenseGetPaginationUseCase(injector()),
    );

    injector.registerLazySingleton<PersonalExpenseGetAllUseCase>(
      () => PersonalExpenseGetAllUseCase(injector()),
    );

    injector.registerLazySingleton<PersonalExpenseSyncUseCase>(
      () => PersonalExpenseSyncUseCase(injector()),
    );

    // NOTIFIER
    injector.registerFactory<AuthNotifier>(
      () => AuthNotifier(injector()),
    );

    injector.registerFactory<ExpensesNotifier>(
      () => ExpensesNotifier(injector(), injector(), injector(), injector(),
          injector(), injector(), injector()),
    );
  }

  static T resolve<T extends Object>() => injector<T>();
}
