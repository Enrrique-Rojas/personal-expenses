import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_expenses/app/features/login/presentation/widget/custom_text_field.dart';
import 'package:personal_expenses/app/features/login/state/auth.notifier.dart';
import 'package:personal_expenses/app/router/app_router.gr.dart'; // Opcional: flutter pub add flutter_animate

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final authState = ref.watch(authNotifierPod);
    final isLoading = authState.maybeMap(loading: (_) => true, orElse: () => false);

    ref.listen<AuthState>(authNotifierPod, (previous, next) {
      next.whenOrNull(
        failure: (message) => _showToast(context, message, Colors.red),
        authenticated: () {
          _showToast(context, '¡Bienvenido de nuevo!', Colors.green);
          context.router.navigate(const ExpenseDetailRoute());
        },
      );
    });

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Titulo con animación
            const Text(
              "Iniciar Sesión",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2),

            const SizedBox(height: 32),

            // Input Email
            CustomTextField(
              controller: emailController,
              label: 'Correo electrónico',
              prefixIcon: Icons.email_rounded,
              enabled: !isLoading,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return 'El correo es obligatorio';
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) return 'Ingresa un correo válido';
                return null;
              },
            ).animate().fadeIn(delay: 200.ms),

            // Input Password
            CustomTextField(
              controller: passwordController,
              label: 'Contraseña',
              prefixIcon: Icons.lock_rounded,
              isPassword: true,
              enabled: !isLoading,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return 'La contraseña es obligatoria';
                if (value.length < 6) return 'Mínimo 6 caracteres';
                return null;
              },
            ).animate().fadeIn(delay: 400.ms),

            const SizedBox(height: 12),

            // Botón Principal con diseño moderno
            _LoginButton(
              isLoading: isLoading,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ref.read(authNotifierPod.notifier).login(
                    emailController.text.trim(),
                    passwordController.text,
                  );
                }
              },
            ).animate().scale(delay: 600.ms, curve: Curves.bounceOut),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () {},
              child: const Text("¿Olvidaste tu contraseña?"),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _LoginButton({required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withBlue(200)],
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
              )
            : const Text(
                'ENTRAR',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
      ),
    );
  }
}
