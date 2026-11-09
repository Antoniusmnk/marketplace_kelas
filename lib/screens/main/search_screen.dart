import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/courses_data.dart';
import '../courses/course_detail_screen.dart';
import 'popular_courses_screen.dart';

class SearchScreen extends StatefulWidget {
  final Function(int)? onTabChange;

  const SearchScreen({super.key, this.onTabChange});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  static const Color primaryColor = Color(0xFF800E13);

  final List<String> _trending = [
    'Python',
    'Bahasa Inggris',
    'excel',
    'Matematika',
  ];

  @override
  void dispose() {
    _searchController.dispose();
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
            // 1. Header Marun dengan Search Bar Melengkung
            _buildHeaderSearch(),

            // 2. Konten Halaman yang Bisa di-Scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Trending Search
                    _buildSectionTitle('Trending Search'),
                    const SizedBox(height: 12),
                    _buildTrendingChips(),

                    const SizedBox(height: 24),

                    // Rekomendasi (Banner Horizontal)
                    _buildSectionTitle('Rekomendasi'),
                    const SizedBox(height: 12),
                    _buildRecommendationBanners(),

                    const SizedBox(height: 24),

                    // Rekomendasi Kursus (Horizontal dengan tombol Lainnya)
                    _buildSectionTitle('Rekomendasi Kursus'),
                    const SizedBox(height: 12),
                    _buildCourseRecommendations(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Header Marun dengan Search Bar ---
  Widget _buildHeaderSearch() {
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
        top: MediaQuery.of(context).padding.top + 12,
        bottom: 18,
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              color: Colors.black87,
              size: 22,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
                decoration: const InputDecoration(
                  hintText: 'Mau cari sesuatu?',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Judul Seksi ---
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  // --- Trending Search Chips ---
  Widget _buildTrendingChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _trending.map((item) {
          return InkWell(
            onTap: () {
              setState(() {
                _searchController.text = item;
              });
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black87, width: 1.2),
              ),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // --- Banner Rekomendasi (Scroll Horizontal) ---
  Widget _buildRecommendationBanners() {
    final bannerCourses = [
      {
        'title': 'Privat Matematika Profesional',
        'image': 'assets/images/banner_kursus_matematika.png',
      },
      {
        'title': 'Kimia Versi Mudah Paham',
        'image': 'assets/images/banner_kursus_kimia.png',
      },
      {
        'title': 'Kursus Bahasa Inggris',
        'image': 'assets/images/banner_kursus_inggris.png',
      },
    ];

    return SizedBox(
      height: 148,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: bannerCourses.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = bannerCourses[index];
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
            borderRadius: BorderRadius.circular(14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                item['image']!,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  // --- Rekomendasi Kursus ---
  Widget _buildCourseRecommendations() {
    final courses = [
      {
        'title': 'Belajar Pemrograman Python',
        'author': 'Programmer Zaman Now',
        'image': 'assets/images/banner_populer_python.png',
      },
      {
        'title': 'Belajar Photoshop Untuk Pemula',
        'author': 'Adil',
        'image': 'assets/images/banner_populer_photoshop.png',
      },
      {
        'title': 'Excel Untuk Data Analys',
        'author': 'HaloTech academy',
        'image': 'assets/images/banner_populer_excel.png',
      },
    ];

    return SizedBox(
      height: 165,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: courses.length + 1, // +1 untuk kartu 'Lainnya' merah
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          // Kartu Terakhir: Box Merah 'Lainnya' persis sesuai Figma
          if (index == courses.length) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PopularCoursesScreen(
                      onNavigateTab: widget.onTabChange,
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Lainnya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            );
          }

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
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 145,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    c['image']!,
                    width: 145,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c['title']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.2,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        c['author']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
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
    );
  }
}
