import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../infrastructure/auth.repo.dart';

part 'auth.notifier.freezed.dart';
part 'auth.state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.authRepo,
  }) : super(const AuthState.initial());

  final AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    if (state is _AuthLoading) return;

    state = const AuthState.loading();

    try {
      await authRepo.login(email: email, password: password);
      if (!mounted) return;
      state = const AuthState.authenticated();
    } catch (e) {
      if (!mounted) return;
      state = AuthState.failure(
          message: e.toString().replaceAll('Exception: ', ''));
    }
  }
}

final authNotifierPod =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    authRepo: ref.read(authRepoPod),
  ),
);
