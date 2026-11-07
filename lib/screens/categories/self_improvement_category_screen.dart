import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/courses_data.dart';
import '../courses/course_detail_screen.dart';

class SelfImprovementCategoryScreen extends StatelessWidget {
  final Function(int)? onNavigateTab;

  const SelfImprovementCategoryScreen({super.key, this.onNavigateTab});

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
            // 1. Header Marun dengan Tombol Panah Kembali & Judul 'Self Improvement'
            _buildHeader(context),

            // 2. Konten Halaman yang Dapat Di-scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Section: Kelas Populer
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(height: 52),

                    // Empty State: Belum ada kelas populer
                    const Center(
                      child: Text(
                        'Belum ada kelas populer',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF9E9E9E),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                    const SizedBox(height: 68),

                    // Section: Semua Kelas
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(height: 16),

                    // Daftar Kelas
                    _buildAllClassesList(),

                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // 3. Bottom Navigation Bar Tetap (Fixed / Non-scrolling)
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
            'Pengembangan Pribadi',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  // --- Section: Semua Kelas (List Vertikal) ---
  Widget _buildAllClassesList() {
    final classes = [
      {
        'title': 'Pola Bicara terstruktur',
        'author': 'Riko Abu Alfatif',
        'image': 'assets/images/thumb_pola_bicara.png',
        'rating': 4,
        'price': 'Rp. 80.000',
      },
      {
        'title': 'Cara Jitu Membangun Kebiasaan',
        'author': 'Maudy Ayunda',
        'image': 'assets/images/banner_membangun_kebiasaan.png',
        'rating': 5,
        'price': 'Rp. 45.000',
      },
      {
        'title': 'Filosofi Anti Cemas',
        'author': 'Greatmind',
        'image': 'assets/images/banner_filosofi_anti_cemas.png',
        'rating': 4,
        'price': 'Rp. 30.000',
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: classes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 18),
      itemBuilder: (context, index) {
        final item = classes[index];
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
              course: findOrCreateCourse(item, 'Pengembangan Pribadi'),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail Image (70x70)
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            item['image'] as String,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 70,
              height: 70,
              color: Colors.grey.shade200,
              child: const Icon(Icons.menu_book, color: primaryColor, size: 28),
            ),
          ),
        ),
        const SizedBox(width: 14),

        // Detail Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                item['title'] as String,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),

              // Author
              Text(
                item['author'] as String,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                  fontFamily: 'Poppins',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // Rating Bintang
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

  // --- Bottom Navigation Bar Tetap (Fixed) ---
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
}
