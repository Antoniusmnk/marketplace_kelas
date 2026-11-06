import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'customer_service_screen.dart';
import 'full_profile_screen.dart';
import 'login_screen.dart';
import 'privacy_policy_screen.dart';
import 'splash_screen.dart';
import 'terms_and_conditions_screen.dart';

class AccountScreen extends StatefulWidget {
  final VoidCallback? onLogout;
  final Function(int)? onNavigateTab;

  const AccountScreen({super.key, this.onLogout, this.onNavigateTab});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  static const Color primaryColor = Color(0xFF800E13);

  // Status Switch Toggle
  bool _wifiOnly = false;
  bool _notification = false;

  // Kualitas Unduhan Video
  String _selectedQuality = 'Terbaik';
  String _selectedQualityResolution = '1080p';

  final List<Map<String, String>> _qualityOptions = const [
    {
      'title': 'Penghemat Data',
      'subtitle': '360p',
    },
    {
      'title': 'Baik',
      'subtitle': '480p',
    },
    {
      'title': 'Lebih Baik',
      'subtitle': '720p',
    },
    {
      'title': 'Terbaik',
      'subtitle': '1080p',
    },
  ];

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
            // 1. Header Marun Polos (Top Rounded)
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

            // 2. Konten Akun yang Dapat di-Scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Profil User (Avatar Lingkaran, Nama, Tombol Profil Lengkap, Label Pelajar)
                    Center(
                      child: Column(
                        children: [
                          // Avatar Maroon Border
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: primaryColor, width: 3.5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person_outline_rounded,
                                size: 44,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Nama Pengguna
                          const Text(
                            'Budiono Siregar',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Kapsul Tombol "Profil Lengkap"
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FullProfileScreen(
                                    onNavigateTab: widget.onNavigateTab,
                                  ),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.black54, width: 1.2),
                              ),
                              child: const Text(
                                'Profil Lengkap',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF555555),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Label Status "Pelajar"
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

                    // 1. Kualitas Unduhan Video
                    _buildNavTile(
                      title: 'Kualitas Unduhan Video',
                      subtitle: _selectedQualityResolution,
                      onTap: _showQualityBottomSheet,
                    ),

                    const SizedBox(height: 18),

                    // 2. Unduh Melalui Wi-Fi saja
                    _buildSwitchTile(
                      title: 'Unduh Melalui Wi-Fi saja',
                      value: _wifiOnly,
                      onChanged: (val) {
                        setState(() {
                          _wifiOnly = val;
                        });
                      },
                    ),

                    const SizedBox(height: 18),

                    // 3. Notifikasi
                    _buildSwitchTile(
                      title: 'Notifikasi',
                      value: _notification,
                      onChanged: (val) {
                        setState(() {
                          _notification = val;
                        });
                      },
                    ),

                    const SizedBox(height: 18),

                    // 4. Versi Aplikasi
                    _buildInfoTile(
                      title: 'versi Aplikasi',
                      subtitle: '0.0.1',
                    ),

                    const SizedBox(height: 20),

                    // 5. Kebijakan Privasi
                    _buildNavTile(
                      title: 'Kebijakan Privasi',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PrivacyPolicyScreen(
                              onNavigateTab: widget.onNavigateTab,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 18),

                    // 6. Syarat dan Ketentuan
                    _buildNavTile(
                      title: 'Syarat dan Ketentuan',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TermsAndConditionsScreen(
                              onNavigateTab: widget.onNavigateTab,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 18),

                    // 7. Costumer Service
                    _buildNavTile(
                      title: 'Costumer Service',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CustomerServiceScreen(
                              onNavigateTab: widget.onNavigateTab,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 38),

                    // 8. Tombol Log Out (Ikon Logout & Teks Merah)
                    InkWell(
                      onTap: () {
                        if (widget.onLogout != null) {
                          widget.onLogout!();
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SplashScreen(
                                nextScreen: LoginScreen(),
                              ),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/icon_logout.png',
                              width: 22,
                              height: 22,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modal Bottom Sheet "Kualitas"
  void _showQualityBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext modalContext) {
        return StatefulBuilder(
          builder: (BuildContext sheetContext, StateSetter setModalState) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                24,
                24,
                24,
                MediaQuery.of(sheetContext).padding.bottom + 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih kualitas video untuk anda unduh. Semakin tinggi kualitas, semakin banyak penyimpanan terpakai',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4A4A4A),
                      fontFamily: 'Poppins',
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ..._qualityOptions.map((option) {
                    final isSelected = _selectedQuality == option['title'];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: () {
                          setModalState(() {
                            _selectedQuality = option['title']!;
                            _selectedQualityResolution = option['subtitle']!;
                          });
                          setState(() {
                            _selectedQuality = option['title']!;
                            _selectedQualityResolution = option['subtitle']!;
                          });
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  option['title']!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  option['subtitle']!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF666666),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            // Custom Animated Switch Toggle
                            GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  _selectedQuality = option['title']!;
                                  _selectedQualityResolution = option['subtitle']!;
                                });
                                setState(() {
                                  _selectedQuality = option['title']!;
                                  _selectedQualityResolution = option['subtitle']!;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 50,
                                height: 28,
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: isSelected
                                      ? primaryColor
                                      : const Color(0xFF5A5A5A),
                                ),
                                child: AnimatedAlign(
                                  duration: const Duration(milliseconds: 200),
                                  alignment: isSelected
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Widget baris dengan Panah (Arrow Forward)
  Widget _buildNavTile({
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ],
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            color: primaryColor,
            size: 20,
          ),
        ],
      ),
    );
  }

  // Widget baris dengan Switch Toggle Nyata
  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: 'Poppins',
          ),
        ),
        Transform.scale(
          scale: 0.85,
          child: Switch(
            value: value,
            activeTrackColor: primaryColor,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFF666666),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  // Widget baris teks info versi
  Widget _buildInfoTile({
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF666666),
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
