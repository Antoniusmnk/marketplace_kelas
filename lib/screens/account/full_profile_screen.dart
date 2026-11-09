import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullProfileScreen extends StatefulWidget {
  final Function(int)? onNavigateTab;
  final String initialName;
  final String initialPhone;
  final String initialEmail;
  final void Function(String name, String phone)? onProfileUpdated;

  const FullProfileScreen({
    super.key,
    this.onNavigateTab,
    this.initialName = 'Budiono Siregar',
    this.initialPhone = '0123456789',
    this.initialEmail = 'Budiono@gmail.com',
    this.onProfileUpdated,
  });

  @override
  State<FullProfileScreen> createState() => _FullProfileScreenState();
}

class _FullProfileScreenState extends State<FullProfileScreen> {
  static const Color primaryColor = Color(0xFF800E13);

  bool _isEditing = false;
  late String _savedName;
  late String _savedPhone;
  late String _savedEmail;

  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _savedName = widget.initialName;
    _savedPhone = widget.initialPhone;
    _savedEmail = widget.initialEmail;

    _nameController = TextEditingController(text: _savedName);
    _phoneController = TextEditingController(text: _savedPhone);
    _emailController = TextEditingController(text: _savedEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
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
                      if (_isEditing) {
                        setState(() {
                          _nameController.text = _savedName;
                          _phoneController.text = _savedPhone;
                          _isEditing = false;
                        });
                      } else {
                        Navigator.pop(context, {
                          'name': _savedName,
                          'phone': _savedPhone,
                        });
                      }
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
                          Text(
                            _savedName,
                            style: const TextStyle(
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

                    // Field 1: Nama Lengkap (Editable saat edit mode)
                    _buildField(
                      label: 'Nama Lengkap',
                      controller: _nameController,
                      isEditable: true,
                    ),

                    const SizedBox(height: 20),

                    // Field 2: No. HP (Editable saat edit mode)
                    _buildField(
                      label: 'No. HP',
                      controller: _phoneController,
                      isEditable: true,
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 20),

                    // Field 3: Email (Tidak bisa diedit sesuai kebutuhan)
                    _buildField(
                      label: 'Email',
                      controller: _emailController,
                      isEditable: false,
                    ),

                    const SizedBox(height: 36),

                    // Bagian Tombol Aksi (Edit Profil ATAU Batal & Simpan)
                    _buildActionButtons(),

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

  // --- Widget Field Outlined (Bisa Teks Biasa atau TextField) ---
  Widget _buildField({
    required String label,
    required TextEditingController controller,
    bool isEditable = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    final bool canEditThisField = _isEditing && isEditable;

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor, width: 1.2),
          ),
          child: canEditThisField
              ? TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontFamily: 'Poppins',
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    controller.text,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  // --- Tombol Aksi Bawah: Edit Profil / (Batal & Simpan) ---
  Widget _buildActionButtons() {
    if (!_isEditing) {
      // Tampilan Awal: Tombol Marun 'Edit Profil'
      return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 165,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _nameController.text = _savedName;
                _phoneController.text = _savedPhone;
                _isEditing = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              'Edit Profil',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      );
    }

    // Tampilan Saat Mode Edit: Tombol 'Batal' dan 'Simpan'
    return Row(
      children: [
        // 1. Tombol Batal
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                // Kembalikan isi input ke data tersimpan awal
                setState(() {
                  _nameController.text = _savedName;
                  _phoneController.text = _savedPhone;
                  _isEditing = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Batal',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        // 2. Tombol Simpan
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                final newName = _nameController.text.trim();
                final newPhone = _phoneController.text.trim();

                if (newName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Nama lengkap tidak boleh kosong.',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                setState(() {
                  _savedName = newName;
                  _savedPhone = newPhone;
                  _isEditing = false;
                });

                widget.onProfileUpdated?.call(_savedName, _savedPhone);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Profil berhasil disimpan!',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
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
            Navigator.pop(context, {
              'name': _savedName,
              'phone': _savedPhone,
            });
          } else {
            Navigator.pop(context, {
              'name': _savedName,
              'phone': _savedPhone,
            });
            if (widget.onNavigateTab != null) {
              widget.onNavigateTab!(index);
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
