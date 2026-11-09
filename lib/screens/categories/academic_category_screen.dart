import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/courses_data.dart';
import '../courses/course_detail_screen.dart';

class AcademicCategoryScreen extends StatelessWidget {
  final Function(int)? onNavigateTab;

  const AcademicCategoryScreen({super.key, this.onNavigateTab});

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
            // 1. Header Marun dengan Tombol Panah Kembali & Judul 'Akademik'
            _buildHeader(context),

            // 2. Konten Halaman yang Dapat Di-scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),

                    // Section: Kelas Populer
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Kelas Populer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildPopularClassesSection(),

                    const SizedBox(height: 24),

                    // Section: Semua Kelas
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Semua Kelas',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildAllClassesList(),

                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
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
        currentIndex: 0,
        onTap: (index) {
          Navigator.pop(context);
          if (onNavigateTab != null) {
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
            'Akademik',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  // --- Section 1: Kelas Populer (Horizontal Scroll) ---
  Widget _buildPopularClassesSection() {
    final popularClasses = [
      {
        'title': 'Privat Matematika Profesional',
        'desc':
            'Kursus privat matematika bersama tutor profesional dengan materi pembelajaran spesifik.',
        'image': 'assets/images/banner_matematika.png',
        'rating': 5,
        'price': 'Rp. 130.000',
        'author': 'Dibuat oleh Andreas Sd, Smp., Sma',
      },
      {
        'title': 'Kimia Versi Mudah Paham',
        'desc': 'Kursus kimia dengan materi yang mudah untuk dipahami.',
        'image': 'assets/images/banner_kimia.png',
        'rating': 3,
        'price': 'Rp. 150.000',
        'author': 'Dibuat oleh Kak Gem',
      },
      {
        'title': 'Kursus Bahasa Inggris',
        'desc':
            'Kursus bahasa inggris dengan materi yang mudah untuk dipahami untuk persiapan TOEFL',
        'image': 'assets/images/banner_inggris.png',
        'rating': 3,
        'price': 'Rp. 100.000',
        'author': 'Dibuat oleh Marie TOEFL',
      },
    ];

    return SizedBox(
      height: 250,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: popularClasses.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = popularClasses[index];
          return _buildPopularCard(context, item);
        },
      ),
    );
  }

  Widget _buildPopularCard(BuildContext context, Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CourseDetailScreen(
              course: findOrCreateCourse(item, 'Akademik'),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
      width: 236,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item['image'] as String,
              height: 114,
              width: 236,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),

          // Title
          Text(
            item['title'] as String,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),

          // Description
          Text(
            item['desc'] as String,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade700,
              height: 1.25,
              fontFamily: 'Poppins',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          // Star Rating
          _buildRatingWidget(item['rating'] as int),
          const SizedBox(height: 4),

          // Price
          Text(
            item['price'] as String,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 2),

          // Author
          Text(
            item['author'] as String,
            style: const TextStyle(
              fontSize: 9.5,
              fontWeight: FontWeight.w500,
              color: primaryColor,
              fontFamily: 'Poppins',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      ),
    );
  }

  // --- Section 2: Semua Kelas (Vertical List) ---
  Widget _buildAllClassesList() {
    final allClasses = [
      {
        'title': 'Termokimia-Materi Kelas 11',
        'author': 'Edcent',
        'image': 'assets/images/banner_termokimia.png',
        'rating': 5,
        'price': 'Rp. 90.000',
      },
      {
        'title': 'Pemahaman Bacaan Dan Menulis UTBK',
        'author': 'Integral Education',
        'image': 'assets/images/banner_pemahaman_bacaan.png',
        'rating': 5,
        'price': 'Rp. 95.000',
      },
      {
        'title': 'Termodinamika',
        'author': 'Edcent',
        'image': 'assets/images/banner_termodinamika.png',
        'rating': 4,
        'price': 'Rp. 80.000',
      },
      {
        'title': 'Dasar Biologi Sel & Molekuler',
        'author': 'Aldi Yazri',
        'image': 'assets/images/banner_biologi.png',
        'rating': 5,
        'price': 'Rp. 90.000',
      },
      {
        'title': 'Kebijakan Fiskal dan Moneter',
        'author': 'Roeang Belajar',
        'image': 'assets/images/banner_fiskal.png',
        'rating': 4,
        'price': 'Rp. 70.000',
      },
      {
        'title': 'Materi Sosiologi TKA-SMA',
        'author': 'Laksana UTBK Rangkuman Audio',
        'image': 'assets/images/banner_sosiologi.png',
        'rating': 5,
        'price': 'Rp. 90.000',
      },
      {
        'title': 'Materi Geografi SMA-TKA',
        'author': 'Edcent',
        'image': 'assets/images/banner_geografi.png',
        'rating': 4,
        'price': 'Rp. 80.000',
      },
      {
        'title': 'Gagasan Pendiri Negara',
        'author': 'Tama Edukasi',
        'image': 'assets/images/banner_gagasan_pendiri_negara.png',
        'rating': 4,
        'price': 'Rp. 60.000',
      },
      {
        'title': 'OOP-Informatika-SMA/K',
        'author': 'Kelas Terbuka',
        'image': 'assets/images/banner_oop.png',
        'rating': 5,
        'price': 'Rp. 60.000',
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allClasses.length,
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        final item = allClasses[index];
        return _buildClassListItem(context, item);
      },
    );
  }

  Widget _buildClassListItem(BuildContext context, Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CourseDetailScreen(
              course: findOrCreateCourse(item, 'Akademik'),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(6),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail Image
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            item['image'] as String,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 48,
              height: 48,
              color: Colors.grey.shade200,
              child: const Icon(Icons.menu_book, color: primaryColor, size: 24),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Info Kolom
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                item['title'] as String,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 1),

              // Author
              Text(
                item['author'] as String,
                style: TextStyle(
                  fontSize: 10.5,
                  color: Colors.grey.shade600,
                  fontFamily: 'Poppins',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),

              // Rating
              _buildRatingWidget(item['rating'] as int),
              const SizedBox(height: 3),

              // Price
              Text(
                item['price'] as String,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }

  // --- Widget Bintang Rating ---
  Widget _buildRatingWidget(int rating) {
    const ratingAssets = {
      3: 'assets/images/rating_star_3.png',
      4: 'assets/images/rating_star_4.png',
      5: 'assets/images/rating_star_5.png',
    };

    final assetPath = ratingAssets[rating];
    if (assetPath != null) {
      return Image.asset(
        assetPath,
        height: 12,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => _buildFallbackStars(rating),
      );
    }
    return _buildFallbackStars(rating);
  }

  Widget _buildFallbackStars(int rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 13,
          color: index < rating
              ? const Color(0xFFFFC107)
              : Colors.grey.shade300,
        );
      }),
    );
  }
}
