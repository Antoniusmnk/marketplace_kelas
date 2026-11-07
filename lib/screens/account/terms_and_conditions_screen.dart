import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  final Function(int)? onNavigateTab;

  const TermsAndConditionsScreen({super.key, this.onNavigateTab});

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
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // 1. Header Marun dengan Tombol Panah Kembali & Judul 'Syarat dan Ketentuan'
            _buildHeader(context),

            // 2. Konten Syarat dan Ketentuan yang Dapat Di-scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Syarat dan Ketentuan',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 18),

                    // 1. Penggunaan Akun
                    _buildTermSection(
                      title: '1. Penggunaan Akun',
                      description:
                          'Pengguna wajib memberikan informasi yang benar dan menjaga kerahasiaan akun masing-masing.',
                    ),
                    const SizedBox(height: 16),

                    // 2. Penggunaan Materi
                    _buildTermSection(
                      title: '2. Penggunaan Materi',
                      description:
                          'Materi pembelajaran hanya boleh digunakan untuk keperluan belajar pribadi dan tidak boleh disebarluaskan tanpa izin.',
                    ),
                    const SizedBox(height: 16),

                    // 3. Hak dan Kewajiban
                    _buildTermSection(
                      title: '3. Hak dan Kewajiban',
                      description:
                          'Pengguna berhak mengakses kelas sesuai ketentuan aplikasi serta wajib menggunakan layanan dengan baik.',
                    ),
                    const SizedBox(height: 16),

                    // 4. Larangan
                    _buildTermSection(
                      title: '4. Larangan',
                      description:
                          'Pengguna dilarang menyalahgunakan aplikasi, membagikan akun secara tidak sah, atau mengganggu pengguna lain.',
                    ),
                    const SizedBox(height: 16),

                    // 5. Perubahan Ketentuan
                    _buildTermSection(
                      title: '5. Perubahan Ketentuan',
                      description:
                          'Aplikasi dapat memperbarui syarat dan ketentuan sesuai kebutuhan. Perubahan akan diinformasikan kepada pengguna.',
                    ),
                    const SizedBox(height: 16),

                    // 6. Bantuan Pengguna
                    _buildTermSection(
                      title: '6. Bantuan Pengguna',
                      description:
                          'Jika mengalami kendala, pengguna dapat menghubungi Customer Service melalui aplikasi.',
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // 3. Bottom Navigation Bar Tetap (Fixed) dengan Tab Akun Aktif
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
        top: MediaQuery.of(context).padding.top + 10,
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
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 4),
          const Text(
            'Syarat dan Ketentuan',
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

  // --- Widget Bagian Syarat & Ketentuan ---
  Widget _buildTermSection({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            fontSize: 13.5,
            color: Colors.black87,
            fontFamily: 'Poppins',
            height: 1.4,
          ),
        ),
      ],
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
        currentIndex: 4, // Tab Akun aktif
        onTap: (index) {
          if (index == 4) {
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
            if (onNavigateTab != null) {
              onNavigateTab!(index);
            }
          }
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
              color: Colors.black87,
            ),
            label: 'Pembelian',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_profile.png',
              width: 22,
              height: 22,
              color: primaryColor,
            ),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
