import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/app/presentation/personal_expense/widgets/scan_qr_screen.dart';

@RoutePage(name: 'ScanQRRoute')
class ScanQRScreen extends StatelessWidget {
  const ScanQRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  ScanQr());
  }
}
