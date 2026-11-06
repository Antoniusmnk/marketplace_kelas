import 'package:flutter/material.dart';

class NexaLogo extends StatelessWidget {
  final double boxSize;

  const NexaLogo({
    super.key,
    this.boxSize = 58.0,
    double borderWidth = 2.5,
    double fontSize = 25.0,
    double numberFontSize = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    const double borderMargin = 2.0;

    return SizedBox(
      width: (boxSize * 2) - borderMargin,
      height: (boxSize * 2) - borderMargin,
      child: Stack(
        children: [
          // Box 1: Ne (Kiri Atas)
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.2),
              ),
              child: Image.asset(
                'assets/images/logo_ne.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Box 2: Xa (Kanan Bawah)
          Positioned(
            left: boxSize - borderMargin,
            top: boxSize - borderMargin,
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.2),
              ),
              child: Image.asset(
                'assets/images/logo_xa.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
