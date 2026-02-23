import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:personal_expenses/app/common/injector/injector.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';
import 'package:personal_expenses/app/domain/usecases/personal_expense.usecase.dart';
import 'package:personal_expenses/app/router/app_router.gr.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  bool _handled = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    torchEnabled: false,
  );

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_handled) return;
    final barcode = capture.barcodes.firstOrNull;
    if (barcode?.rawValue == null) return;

    _handled = true;
    setState(() {});

    HapticFeedback.heavyImpact();
    _audioPlayer.play(AssetSource('sounds/beep.mp3'));

    try {
      var raw = barcode!.rawValue!.trim();

      final dynamic decoded = jsonDecode(raw);

      if (decoded is Map<String, dynamic>) {
        final data = decoded;

        final requiredFields = [
          'label',
          'amount',
          'currency',
          'date',
          'category'
        ];

        for (var field in requiredFields) {
          final value = data[field];
          if (value == null || value.toString().trim().isEmpty) {
            _showInvalidQr('QR inválido');
          }
        }

        final String finalCode =
            (data['code'] != null && data['code'].toString().isNotEmpty)
                ? data['code'].toString()
                : "QR_${DateTime.now().millisecondsSinceEpoch}";

        final getByIdUseCase =
            Injector.resolve<PersonalExpenseGetByIdUseCase>();
        getByIdUseCase.execute(finalCode).then((result) {
          if (!mounted) return;
          result.fold(
            (failure) => _navigateToForm(data, finalCode),
            (existing) {
              if (existing != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Este QR ya fue registrado'),
                    backgroundColor: Colors.orange,
                  ),
                );
                _showInvalidQr('QR ya registrado');
              } else {
                _navigateToForm(data, finalCode);
              }
            },
          );
        });
      } else {
        _showInvalidQr('QR inválido');
      }
    } catch (e) {
      if (!mounted) return;
      _showInvalidQr('QR inválido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Escanear QR"),
        actions: [
          IconButton(
            icon: const Icon(Icons.flashlight_on),
            onPressed: () => _controller.toggleTorch(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.5),
              BlendMode.srcOut,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
                Center(
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 260,
              height: 260,
              child: Stack(
                children: [
                  _Corner(
                      top: 0,
                      left: 0,
                      isTop: true,
                      isLeft: true,
                      detected: _handled),
                  _Corner(
                      top: 0,
                      right: 0,
                      isTop: true,
                      isLeft: false,
                      detected: _handled),
                  _Corner(
                      bottom: 0,
                      left: 0,
                      isTop: false,
                      isLeft: true,
                      detected: _handled),
                  _Corner(
                      bottom: 0,
                      right: 0,
                      isTop: false,
                      isLeft: false,
                      detected: _handled),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Text(
              _handled ? '✓ QR detectado' : 'Apunta al código QR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _handled ? Colors.green : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToForm(Map<String, dynamic> data, String code) {
    final expense = PersonalExpenseEntity(
      code: code,
      label: data['label'].toString(),
      amount: (data['amount'] as num).toDouble(),
      currency: data['currency'].toString(),
      date: DateTime.tryParse(data['date'].toString()) ?? DateTime.now(),
      category: data['category'].toString(),
    );

    if (!mounted) return;
    context.router
        .replace(ExpenseFormRoute(expense: expense, forceCreate: true));
  }

  void _showInvalidQr(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _handled = false);
    });
  }
}

class _Corner extends StatelessWidget {
  final double? top, bottom, left, right;
  final bool isTop, isLeft, detected;

  const _Corner({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.isTop,
    required this.isLeft,
    required this.detected,
  });

  @override
  Widget build(BuildContext context) {
    final color = detected ? Colors.green : Colors.white;
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          border: Border(
            top: isTop ? BorderSide(color: color, width: 4) : BorderSide.none,
            bottom:
                !isTop ? BorderSide(color: color, width: 4) : BorderSide.none,
            left: isLeft ? BorderSide(color: color, width: 4) : BorderSide.none,
            right:
                !isLeft ? BorderSide(color: color, width: 4) : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
