import 'package:auto_route/auto_route.dart';
import 'package:personal_expenses/app/router/app_router.gr.dart';

@AutoRouterConfig(generateForDir: ['lib/app/router/routes'])
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          path: '/login',
          page: LoginRoute.page,
          initial: true,
        ),
        AdaptiveRoute(
          path: '/expenses',
          page: ExpensesListRoute.page,
        ),
        AdaptiveRoute(
          path: '/expenses/detail',
          page: ExpenseDetailRoute.page,
        ),
        AdaptiveRoute(
          path: '/expenses/form',
          page: ExpenseFormRoute.page,
        ),
        AdaptiveRoute(
          path: '/expenses/scan_qr',
          page: ScanQRRoute.page,
        ),
        AdaptiveRoute(
          path: '/chart',
          page: ChartRoute.page,
        ),
      ];
}
