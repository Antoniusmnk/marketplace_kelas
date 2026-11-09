import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  final Widget? nextScreen;
  final Duration duration;

  const LoadingScreen({
    super.key,
    this.nextScreen,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  late final AnimationController _animController;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _timer = Timer(widget.duration, () {
      if (mounted) {
        _animController.stop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => widget.nextScreen ?? const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animController.dispose();
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
              // 1. Spinner Berputar dari Aset Desain Proyek
              RotationTransition(
                turns: _animController,
                child: Image.asset(
                  'assets/images/spinner_loading.png',
                  width: 72,
                  height: 72,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 38),

              // 2. Teks Informasi Sedang Masuk
              const Text(
                'Sedang masuk, harap\ntunggu...',
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
