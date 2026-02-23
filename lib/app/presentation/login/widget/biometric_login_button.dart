import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_biometric/simple_biometric.dart';
import 'package:simple_biometric/enums.dart';
import 'package:personal_expenses/app/presentation/login/state/auth.notifier.dart';
import 'dart:io';

class BiometricLoginButton extends ConsumerStatefulWidget {
  const BiometricLoginButton({super.key});

  @override
  ConsumerState<BiometricLoginButton> createState() => _BiometricLoginButtonState();
}

class _BiometricLoginButtonState extends ConsumerState<BiometricLoginButton> {
  final SimpleBiometric _simpleBiometric = SimpleBiometric();
  bool _isLoading = false;

  Future<void> _biometricLogin() async {
    setState(() => _isLoading = true);
    try {
      BiometricStatusResult? result;
      if (Platform.isIOS) {
        final iosType = await _simpleBiometric.getIOSBiometricType();
        if (iosType == IOSBiometricType.faceId) {
          result = await _simpleBiometric.showBiometricPrompt(
            title: 'Face ID',
            description: 'Verifica tu identidad con Face ID',
            cancelText: 'Cancelar',
          );
        } else {
          result = await _simpleBiometric.showBiometricPrompt(
            title: 'Touch ID',
            description: 'Verifica tu identidad con Touch ID',
            cancelText: 'Cancelar',
          );
        }
      } else {
        result = await _simpleBiometric.showBiometricPrompt(
          title: 'Autenticación biométrica',
          description: 'Verifica tu identidad para ingresar',
          cancelText: 'Cancelar',
        );
      }
      if (result == BiometricStatusResult.authSuccess) {
        ref.read(authNotifierPod.notifier).login('test@test.com', '123456');
      }
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de autenticación biométrica: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton.icon(
        icon: Platform.isIOS
            ? const Icon(Icons.face, color: Colors.white)
            : const Icon(Icons.fingerprint, color: Colors.white),
        label: _isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                Platform.isIOS ? 'ENTRAR CON FACE ID' : 'ENTRAR CON BIOMETRÍA',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: _isLoading ? null : _biometricLogin,
      ),
    );
  }
}
