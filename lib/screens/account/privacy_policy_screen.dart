import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final Function(int)? onNavigateTab;

  const PrivacyPolicyScreen({super.key, this.onNavigateTab});

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
            // 1. Header Marun dengan Tombol Panah Kembali & Judul 'Kebijakan Privasi'
            _buildHeader(context),

            // 2. Konten Kebijakan Privasi yang Dapat Di-scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kebijakan  Privasi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 18),

                    // 1. Informasi Pengguna
                    _buildPolicySection(
                      title: '1. Informasi Pengguna',
                      description:
                          'Aplikasi mengumpulkan informasi seperti nama, alamat email, dan data akun untuk mendukung proses pembelajaran.',
                    ),
                    const SizedBox(height: 16),

                    // 2. Penggunaan Data
                    _buildPolicySection(
                      title: '2. Penggunaan Data',
                      description:
                          'Data pengguna digunakan untuk mengelola akun, menyimpan progres belajar, dan memberikan informasi terkait kelas online.',
                    ),
                    const SizedBox(height: 16),

                    // 3. Keamanan Data
                    _buildPolicySection(
                      title: '3. Keamanan Data',
                      description:
                          'Kami berupaya menjaga keamanan informasi pengguna agar tidak disalahgunakan oleh pihak yang tidak berwenang.',
                    ),
                    const SizedBox(height: 16),

                    // 4. Riwayat Pembelajaran
                    _buildPolicySection(
                      title: '4. Riwayat Pembelajaran',
                      description:
                          'Aplikasi dapat menyimpan riwayat kelas yang diikuti dan progres belajar untuk memudahkan pengguna melanjutkan pembelajaran.',
                    ),
                    const SizedBox(height: 16),

                    // 5. Kontak
                    _buildPolicySection(
                      title: '5. Kontak',
                      description:
                          'Jika memiliki pertanyaan mengenai privasi, pengguna dapat menghubungi layanan bantuan aplikasi.',
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
            'Kebijakan Privasi',
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

  // --- Widget Bagian Kebijakan ---
  Widget _buildPolicySection({
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
