import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final secureStoragePod = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

class AuthRepo {
  const AuthRepo({required this.storage});

  final FlutterSecureStorage storage;

  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'test@test.com' && password == '123456') {
      await storage.write(key: 'auth_token', value: 'mock_secure_token_123');
      return;
    }

    throw Exception('Correo o contraseña incorrectos');
  }
}

final authRepoPod = Provider<AuthRepo>(
  (ref) => AuthRepo(storage: ref.read(secureStoragePod)),
);
