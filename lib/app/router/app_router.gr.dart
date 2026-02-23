// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart'
    as _i9;
import 'package:personal_expenses/app/router/routes/chart/screen.dart' as _i1;
import 'package:personal_expenses/app/router/routes/login/screen.dart' as _i5;
import 'package:personal_expenses/app/router/routes/personal_expense/detail/screen.dart'
    as _i2;
import 'package:personal_expenses/app/router/routes/personal_expense/form/screen.dart'
    as _i3;
import 'package:personal_expenses/app/router/routes/personal_expense/list/screen.dart'
    as _i4;
import 'package:personal_expenses/app/router/routes/personal_expense/scan_qr/screen.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ChartRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChartScreen(),
      );
    },
    ExpenseDetailRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExpenseDetailScreen(),
      );
    },
    ExpenseFormRoute.name: (routeData) {
      final args = routeData.argsAs<ExpenseFormRouteArgs>(
          orElse: () => const ExpenseFormRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ExpenseFormScreen(
          key: args.key,
          expense: args.expense,
          isViewOnly: args.isViewOnly,
          forceCreate: args.forceCreate,
        ),
      );
    },
    ExpensesListRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ExpensesListScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    ScanQRRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ScanQRScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChartScreen]
class ChartRoute extends _i7.PageRouteInfo<void> {
  const ChartRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ChartRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChartRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExpenseDetailScreen]
class ExpenseDetailRoute extends _i7.PageRouteInfo<void> {
  const ExpenseDetailRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ExpenseDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExpenseDetailRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ExpenseFormScreen]
class ExpenseFormRoute extends _i7.PageRouteInfo<ExpenseFormRouteArgs> {
  ExpenseFormRoute({
    _i8.Key? key,
    _i9.PersonalExpenseEntity? expense,
    bool isViewOnly = false,
    bool forceCreate = false,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ExpenseFormRoute.name,
          args: ExpenseFormRouteArgs(
            key: key,
            expense: expense,
            isViewOnly: isViewOnly,
            forceCreate: forceCreate,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpenseFormRoute';

  static const _i7.PageInfo<ExpenseFormRouteArgs> page =
      _i7.PageInfo<ExpenseFormRouteArgs>(name);
}

class ExpenseFormRouteArgs {
  const ExpenseFormRouteArgs({
    this.key,
    this.expense,
    this.isViewOnly = false,
    this.forceCreate = false,
  });

  final _i8.Key? key;

  final _i9.PersonalExpenseEntity? expense;

  final bool isViewOnly;

  final bool forceCreate;

  @override
  String toString() {
    return 'ExpenseFormRouteArgs{key: $key, expense: $expense, isViewOnly: $isViewOnly, forceCreate: $forceCreate}';
  }
}

/// generated route for
/// [_i4.ExpensesListScreen]
class ExpensesListRoute extends _i7.PageRouteInfo<void> {
  const ExpensesListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ExpensesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExpensesListRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ScanQRScreen]
class ScanQRRoute extends _i7.PageRouteInfo<void> {
  const ScanQRRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ScanQRRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanQRRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
