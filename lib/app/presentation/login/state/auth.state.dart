
part of 'auth.notifier.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.authenticated() = _AuthAuthenticated;
  const factory AuthState.failure({
    required String message,
  }) = _AuthFailure;
}
