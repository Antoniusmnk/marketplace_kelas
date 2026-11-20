import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/courses_data.dart';
import '../../models/course_model.dart';
import '../courses/course_detail_screen.dart';

class CourseScreen extends StatefulWidget {
  final int initialFilterIndex;

  const CourseScreen({super.key, this.initialFilterIndex = 0});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  static const Color primaryColor = Color(0xFF800E13);
  late int _selectedFilterIndex;

  @override
  void initState() {
    super.initState();
    _selectedFilterIndex = widget.initialFilterIndex;
  }

  @override
  void didUpdateWidget(covariant CourseScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialFilterIndex != widget.initialFilterIndex) {
      _selectedFilterIndex = widget.initialFilterIndex;
    }
  }

  final List<String> _filters = [
    'Semua',
    'Unduhan',
    'Favorit',
    'Diarsipkan',
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
            // 1. Header Marun 'Lihat Kursusmu Disini'
            _buildHeader(),

            // 2. Baris Filter Chips (Semua, Unduhan, Favorit, Diarsipkan)
            const SizedBox(height: 16),
            _buildFilterTabs(),

            // 3. Tampilan Konten Tengah (Berdasarkan filter tab yang aktif)
            Expanded(
              child: _buildBodyContent(),
            ),
          ],
        ),
      ),
    );
  }

  // --- Konten Tengah Dinamis ---
  Widget _buildBodyContent() {
    if (_selectedFilterIndex == 0) {
      // Tampilan Tab 'Semua': tampilkan kursus yang sudah dibeli jika ada
      if (purchasedCourses.isNotEmpty) {
        return _buildPurchasedCourseList();
      }
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCourseIllustration(),
              const SizedBox(height: 28),
              const Text(
                'Apa yang mau dipelajari hari ini?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Kursusmu akan tersimpan disini.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF666666),
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    } else if (_selectedFilterIndex == 1) {
      // Tampilan Tab 'Unduhan': tampilkan kursus yang sudah dibeli jika ada
      if (purchasedCourses.isNotEmpty) {
        return _buildPurchasedCourseList();
      }
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/icon_download_cloud.png',
                width: 64,
                height: 64,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 28),
              const Text(
                'Belum ada yang diunduh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Kursus yang telah kamu unduh\nakan ada disini',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF666666),
                  fontFamily: 'Poppins',
                  height: 1.35,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    } else if (_selectedFilterIndex == 2) {
      // Tampilan Tab 'Favorit'
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/icon_favorite_heart.png',
                width: 54,
                height: 54,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Text(
                'Belum ada kursus favorit',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF555555),
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    } else if (_selectedFilterIndex == 3) {
      // Tampilan Tab 'Diarsipkan' / 'Arsip'
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tidak ada arsip',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF555555),
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  // --- Daftar Kursus yang Telah Dibeli (Tab Semua & Unduhan) ---
  Widget _buildPurchasedCourseList() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: purchasedCourses.length,
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        final course = purchasedCourses[index];
        return _buildCourseCard(course);
      },
    );
  }

  // --- Kartu Kursus yang Telah Dibeli ---
  Widget _buildCourseCard(CourseModel course) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CourseDetailScreen(
              course: course,
              isPurchased: true,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE5E5E5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Thumbnail Kursus
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                course.thumbnailAsset,
                width: 88,
                height: 64,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 88,
                  height: 64,
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.play_circle_outline,
                    color: primaryColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Informasi Kursus
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    course.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    course.instructor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: Color(0xFF666666),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.category,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xFF81C784),
                            width: 0.8,
                          ),
                        ),
                        child: const Text(
                          'Sudah Dibeli',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2E7D32),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Header Marun ---
  Widget _buildHeader() {
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
      child: const Text(
        'Lihat Kursusmu Disini',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  // --- Filter Tabs (Semua, Unduhan, Favorit, Diarsipkan) ---
  Widget _buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final isSelected = _selectedFilterIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedFilterIndex = index;
                });
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                decoration: BoxDecoration(
                  color: isSelected ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? primaryColor : Colors.black87,
                    width: 1.2,
                  ),
                ),
                child: Text(
                  _filters[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.black87,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // --- Komposisi Ilustrasi Aset Kursus ---
  Widget _buildCourseIllustration() {
    return SizedBox(
      width: 140,
      height: 125,
      child: Stack(
        children: [
          // 1. Ikon Daftar / Card (kiri atas)
          Positioned(
            left: 0,
            top: 6,
            child: Image.asset(
              'assets/images/icon_course_list.png',
              width: 48,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
          // 2. Ikon Buku Terbuka (kanan atas)
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              'assets/images/icon_course_book.png',
              width: 78,
              height: 82,
              fit: BoxFit.contain,
            ),
          ),
          // 3. Ikon Play Diamond (tengah bawah)
          Positioned(
            left: 30,
            bottom: 0,
            child: Image.asset(
              'assets/images/icon_course_play.png',
              width: 52,
              height: 52,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
