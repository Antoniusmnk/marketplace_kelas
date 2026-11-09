import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/courses_data.dart';
import '../courses/course_detail_screen.dart';

class PopularCoursesScreen extends StatelessWidget {
  final Function(int)? onNavigateTab;

  const PopularCoursesScreen({super.key, this.onNavigateTab});

  static const Color primaryColor = Color(0xFF800E13);

  final List<Map<String, dynamic>> courses = const [
    {
      'title': 'Privat Matematika Profesional',
      'tutor': 'Andreas Sd,. Smp,. Sma.',
      'rating': 5.0,
      'price': 'Rp. 130.000',
      'desc':
          'Kursus privat matematika bersama tutor profesional dengan materi pembelajaran spesifik.',
      'image': 'assets/images/banner_kursus_matematika.png',
    },
    {
      'title': 'Kimia Versi Mudah Paham',
      'tutor': 'Kak Gem',
      'rating': 4.0,
      'price': 'Rp. 150.000',
      'desc': 'Kursus kimia dengan materi yang mudah untuk dipahami.',
      'image': 'assets/images/banner_kursus_kimia.png',
    },
    {
      'title': 'Kursus Bahasa inggris',
      'tutor': 'Marie TOEFL',
      'rating': 3.0,
      'price': 'Rp. 100.000',
      'desc':
          'Kursus bahasa inggris untuk meningkatkan skill bahasa inggris',
      'image': 'assets/images/banner_kursus_inggris.png',
    },
    {
      'title': 'Belajar Pemrograman Python',
      'tutor': 'Progammer Zaman Now',
      'rating': 5.0,
      'price': 'Rp. 130.000',
      'desc':
          'Berisikan materi untuk pemula belajar pemrograman python yang rinci.',
      'image': 'assets/images/banner_populer_python.png',
    },
    {
      'title': 'Photoshop Untuk Pemula',
      'tutor': 'Adil',
      'rating': 4.0,
      'price': 'Rp. 100.000',
      'desc':
          'Kelas photoshop untuk yang ingin mengembangkan skill editing.',
      'image': 'assets/images/banner_populer_photoshop.png',
    },
    {
      'title': 'Excel Untuk Data Analyst',
      'tutor': 'HaloTech academy',
      'rating': 4.0,
      'price': 'Rp. 150.000',
      'desc':
          'Kelas excel untuk mengupgrade skill mengelola data bagi data analyst',
      'image': 'assets/images/banner_populer_excel.png',
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
            // 1. Header Marun dengan Tombol Back & Judul 'Kursus Populer'
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
                    'Kursus Populer',
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

            // 2. Daftar Kursus Vertikal
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemCount: courses.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final c = courses[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CourseDetailScreen(
                            course: findOrCreateCourse(c, 'Populer'),
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kolom Kiri: Thumbnail Gambar + Judul & Tutor di bawahnya
                      SizedBox(
                        width: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                c['image'] as String,
                                width: 170,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              c['title'] as String,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontFamily: 'Poppins',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              c['tutor'] as String,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF666666),
                                fontFamily: 'Poppins',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Kolom Kanan: Judul, Rating Bintang, Harga, Deskripsi
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c['title'] as String,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontFamily: 'Poppins',
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            // Rating Bintang
                            _buildRatingStars((c['rating'] as num).toDouble()),
                            const SizedBox(height: 4),
                            // Harga
                            Text(
                              c['price'] as String,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Deskripsi
                            Text(
                              c['desc'] as String,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF444444),
                                fontFamily: 'Poppins',
                                height: 1.25,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // 3. Bottom Navigation Bar Terintegrasi
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
            Navigator.pop(context);
            if (index != 0 && onNavigateTab != null) {
              onNavigateTab!(index);
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

  Widget _buildRatingStars(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFilled = index < rating;
        return Icon(
          Icons.star_rounded,
          size: 16,
          color: isFilled ? const Color(0xFFFFC107) : const Color(0xFFBDBDBD),
        );
      }),
    );
  }
}
