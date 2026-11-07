import 'package:flutter/material.dart';
import '../../main/home_screen.dart';

class CartSuccessBottomSheet extends StatelessWidget {
  const CartSuccessBottomSheet({super.key});

  /// Menampilkan modal bottom sheet dengan animasi slide-up dari bawah ke atas,
  /// terposisi di bottom-center, dan otomatis dismiss slide-down jika mengklik di luar area.
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => const CartSuccessBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 36),

            // 1. Judul Pesan Berhasil
            const Text(
              'Anda berhasil menambahkan\nkursus dikeranjang!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
                height: 1.35,
              ),
            ),

            const SizedBox(height: 22),

            // 2. Ikon Burst/Splash dari Aset Desain
            Image.asset(
              'assets/images/icon_cart_success.png',
              width: 52,
              height: 52,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 26),

            // 3. Teks Subtitle
            const Text(
              'Yuk, selesaikan pembelianmu\ndikeranjang.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF444444),
                fontFamily: 'Poppins',
                height: 1.4,
              ),
            ),

            const SizedBox(height: 36),

            // 4. Tombol Aksi: Lanjut Ke Keranjang
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup bottom sheet
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(initialIndex: 3),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF800E13),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Lanjut Ke Keranjang',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
