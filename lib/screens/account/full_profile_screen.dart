import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullProfileScreen extends StatelessWidget {
  final Function(int)? onNavigateTab;

  const FullProfileScreen({super.key, this.onNavigateTab});

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
            // 1. Header Marun Polos di bagian atas (Top Rounded)
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).padding.top + 45,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),

            // 2. Bar Judul dengan Tombol Kembali
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 20, top: 12, bottom: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: primaryColor,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Profil Lengkap',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),

            // 3. Konten Profil yang Dapat Di-scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // Avatar & Info Pengguna
                    Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/icon_profile_maroon.png',
                            width: 82,
                            height: 82,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 82,
                              height: 82,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primaryColor, width: 3.5),
                              ),
                              child: const Icon(
                                Icons.person_outline_rounded,
                                size: 50,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'Budiono Siregar',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Pelajar',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Field 1: Nama Lengkap
                    _buildProfileField(
                      label: 'Nama Lengkap',
                      value: 'Budiono Siregar',
                    ),

                    const SizedBox(height: 20),

                    // Field 2: No. HP
                    _buildProfileField(
                      label: 'No. HP',
                      value: '0123456789',
                    ),

                    const SizedBox(height: 20),

                    // Field 3: Email
                    _buildProfileField(
                      label: 'Email',
                      value: 'Budiono@gmail.com',
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // 4. Bottom Navigation Bar Tetap (Fixed / Non-scrolling, Tab Akun Aktif)
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // --- Widget Kolom Profil Outlined ---
  Widget _buildProfileField({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor, width: 1.2),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }

  // --- Bottom Navigation Bar Terintegrasi (Tab Akun Aktif) ---
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
        currentIndex: 4,
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
