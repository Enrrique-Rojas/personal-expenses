// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_expenses/app/common/widget/toast.dart';
import 'package:personal_expenses/app/presentation/personal_expense/state/expenses.notifier.dart';
import 'package:personal_expenses/app/router/app_router.gr.dart';

class AppBarExpenses extends StatelessWidget implements PreferredSizeWidget {
  const AppBarExpenses({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.logout),
        tooltip: "Cerrar sesión",
        onPressed: () {
          context.router.replace(const LoginRoute());
        },
      ),
      title: const Text(
        'Mis Gastos',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      actions: const [
        SyncAppBarButton(),
        _MoreActionsButton(),
        SizedBox(width: 8),
      ],
    );
  }
}

class _MoreActionsButton extends StatelessWidget {
  const _MoreActionsButton();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: "Más opciones",
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case 'qr':
            context.router.push(const ScanQRRoute());
            break;
          case 'charts':
            context.router.push(const ChartRoute());
            break;
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 'qr',
          child: Row(
            children: [
              Icon(Icons.qr_code_scanner_rounded, size: 20),
              SizedBox(width: 8),
              Text('Leer QR'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'charts',
          child: Row(
            children: [
              Icon(Icons.bar_chart_rounded, size: 20),
              SizedBox(width: 8),
              Text('Ver gráficos'),
            ],
          ),
        ),
      ],
    ).animate().fade(duration: 300.ms);
  }
}

class SyncAppBarButton extends HookConsumerWidget {
  const SyncAppBarButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 800));
    final isSyncing = useState(false);

    Future<void> startSync() async {
      if (isSyncing.value) return;

      isSyncing.value = true;
      controller.repeat();

      try {
        await ref.read(expenseNotifierPod.notifier).syncExpenses();
        Toast.showToast(
          context,
          'Sincronización completada',
          Colors.green,
        );
      } catch (e) {
        Toast.showToast(
          context,
          'Error al sincronizar',
          Colors.red,
        );
      } finally {
        controller.stop();
        controller.reset();
        isSyncing.value = false;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Tooltip(
        message: "Sincronizar",
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: startSync,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: RotationTransition(
                turns: controller,
                child: Icon(
                  Icons.sync_rounded,
                  size: 20,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
