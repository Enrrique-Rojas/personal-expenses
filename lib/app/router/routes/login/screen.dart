import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/app/features/login/presentation/login_form.dart';

@RoutePage(name: 'LoginRoute')
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const LoginForm()),
    );
  }
}
