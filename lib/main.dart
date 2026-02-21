import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app/router/app_router.dart';

void main() => runApp(
  ProviderScope(
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Personal Expenses',
      routerConfig: _appRouter.config(),
    );
  }
}
