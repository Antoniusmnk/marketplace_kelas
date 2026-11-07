import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/nexa_logo.dart';
import 'register_screen.dart';

class SplashScreen extends StatefulWidget {
  final Widget? nextScreen;
  final Duration duration;

  const SplashScreen({
    super.key,
    this.nextScreen,
    this.duration = const Duration(milliseconds: 2500),
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(widget.duration, () {
      if (mounted) {
        _navigateToNext();
      }
    });
  }

  void _navigateToNext() {
    _timer?.cancel();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => widget.nextScreen ?? const RegisterScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF800E13),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _navigateToNext,
        child: const Center(
          child: NexaLogo(
            boxSize: 58.0,
            borderWidth: 2.5,
            fontSize: 25.0,
            numberFontSize: 10.0,
          ),
        ),
      ),
    );
  }
}
