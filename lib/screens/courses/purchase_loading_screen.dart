import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'purchase_success_screen.dart';

class PurchaseLoadingScreen extends StatefulWidget {
  final Duration duration;
  final Widget? nextScreen;
  final VoidCallback? onComplete;

  const PurchaseLoadingScreen({
    super.key,
    this.duration = const Duration(milliseconds: 2500),
    this.nextScreen,
    this.onComplete,
  });

  @override
  State<PurchaseLoadingScreen> createState() => _PurchaseLoadingScreenState();
}

class _PurchaseLoadingScreenState extends State<PurchaseLoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Animasi putaran spinner
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    // Timer loading selama 2.5 detik
    _timer = Timer(widget.duration, () {
      if (!mounted) return;
      if (widget.nextScreen != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => widget.nextScreen!),
        );
      } else if (widget.onComplete != null) {
        widget.onComplete!();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const PurchaseSuccessScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. Spinner Berputar dari Aset yang Diberikan
              RotationTransition(
                turns: _rotationController,
                child: Image.asset(
                  'assets/images/spinner_purchase.png',
                  width: 72,
                  height: 72,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 38),

              // 2. Teks Informasi Sedang Membeli
              const Text(
                'Sedang membeli, harap\ntunggu...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
