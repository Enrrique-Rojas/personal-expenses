import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_expenses/app/common/injector/injector.dart';
import 'package:personal_expenses/app/domain/entities/auth/auth.entity.dart';
import 'package:personal_expenses/app/domain/usecases/auth.usecase.dart';


part 'auth.notifier.freezed.dart';
part 'auth.state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;
  AuthNotifier(this._authUseCase) : super(const AuthState.initial());
  
  Future<void> login(String email, String password) async {
    if (!mounted) return;
    if (state is _AuthLoading) return;

    state = const AuthState.loading();

    try {
      await _authUseCase.execute(AuthEntity(email:  email, password: password));
      state = const AuthState.authenticated();
    } catch (e) {
      state = AuthState.failure(message: e.toString().replaceAll('Exception: ', ''));
    }
  }
}

final authNotifierPod = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    return Injector.resolve<AuthNotifier>();
  },
);