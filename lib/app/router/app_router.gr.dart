// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:personal_expenses/app/router/routes/expenses/detail/screen.dart'
    as _i1;
import 'package:personal_expenses/app/router/routes/expenses/list/screen.dart'
    as _i2;
import 'package:personal_expenses/app/router/routes/login/screen.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ExpenseDetailRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ExpenseDetailScreen(),
      );
    },
    ExpensesListRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExpensesListScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ExpenseDetailScreen]
class ExpenseDetailRoute extends _i4.PageRouteInfo<void> {
  const ExpenseDetailRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ExpenseDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExpenseDetailRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExpensesListScreen]
class ExpensesListRoute extends _i4.PageRouteInfo<void> {
  const ExpensesListRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ExpensesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExpensesListRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
