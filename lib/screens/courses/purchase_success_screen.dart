import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main/home_screen.dart';

class PurchaseSuccessScreen extends StatelessWidget {
  const PurchaseSuccessScreen({super.key});

  static const Color primaryColor = Color(0xFF800E13);

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
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // 1. Header Marun dengan Tombol Panah Kembali & Judul 'Daftar Pembelian'
            _buildHeader(context),

            // 2. Konten Utama Sukses Pembelian
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Ikon Centang Marun dari Aset Desain
                      Image.asset(
                        'assets/images/icon_purchase_success.png',
                        width: 54,
                        height: 54,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 18),

                      // Teks 'Berhasil!'
                      const Text(
                        'Berhasil!',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),

                      const SizedBox(height: 92),

                      // Teks 'Anda berhasil membeli!'
                      const Text(
                        'Anda berhasil membeli!',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Teks Deskripsi Informasi Akun
                      const Text(
                        'Anda berhasil membeli produk dari\nNexa-Course Online, dan masuk ke\nakunmu.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF555555),
                          fontFamily: 'Poppins',
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // 3. Bottom Navigation Bar Terintegrasi (Aktif pada Tab Pembelian)
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // --- Header Marun ---
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        bottom: 16,
        left: 8,
        right: 16,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              // Mengarahkan ke halaman utama pembelian (tab index 3 di HomeScreen)
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeScreen(initialIndex: 3),
                ),
                (route) => false,
              );
            },
          ),
          const SizedBox(width: 4),
          const Text(
            'Daftar Pembelian',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  // --- Bottom Navigation Bar ---
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: 3, // Tab Pembelian aktif
        onTap: (index) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => HomeScreen(initialIndex: index),
            ),
            (route) => false,
          );
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black87,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontFamily: 'Poppins',
        ),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_home.png',
              width: 22,
              height: 22,
              color: Colors.black87,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_search.png',
              width: 22,
              height: 22,
              color: Colors.black87,
            ),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_course.png',
              width: 22,
              height: 22,
              color: Colors.black87,
            ),
            label: 'Kursus',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_cart.png',
              width: 22,
              height: 22,
              color: primaryColor,
            ),
            label: 'Pembelian',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_profile.png',
              width: 22,
              height: 22,
              color: Colors.black87,
            ),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
