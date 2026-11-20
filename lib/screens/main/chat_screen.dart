import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/courses_data.dart';
import 'chat_detail_screen.dart';
import 'home_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Marun dengan Tombol Back & Judul 'Chat'
            Container(
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
                left: 16,
                right: 20,
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
                  const SizedBox(width: 8),
                  const Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // 2. Judul Seksi: 'Chat dengan Instrukturmu!'
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Chat dengan Instrukturmu!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 3. Daftar Chat Instruktur
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: chatInstructors.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final instructor = chatInstructors[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailScreen(
                          instructorName: instructor['name']!,
                          avatarAsset: instructor['avatar']!,
                          initialInstructorMessage: instructor['message']!,
                          initialUserMessage: instructor['user_reply']!,
                        ),
                      ),
                    ).then((_) {
                      if (mounted) setState(() {});
                    });
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        // Avatar Instruktur
                        ClipOval(
                          child: Image.asset(
                            instructor['avatar']!,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 48,
                              height: 48,
                              color: Colors.grey.shade300,
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),

                        // Nama & Pesan
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                instructor['name']!,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                instructor['message']!,
                                style: const TextStyle(
                                  fontSize: 12.5,
                                  color: Color(0xFF666666),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // 4. Pesan Placeholder di Bagian Tengah Bawah
            const Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Tanyakan Hal Yang Kamu Mau\nPada Instruktur Kami',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF777777),
                      fontFamily: 'Poppins',
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // 5. Bottom Navigation Bar Terintegrasi (Tab Beranda Aktif)
      bottomNavigationBar: Container(
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
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.pop(context);
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(initialIndex: index),
                ),
                (route) => false,
              );
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
                color: primaryColor,
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
                color: Colors.black87,
              ),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}
