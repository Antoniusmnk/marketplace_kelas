import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'academic_category_screen.dart';
import 'account_screen.dart';
import 'business_category_screen.dart';
import 'category_list_screen.dart';
import 'computer_network_category_screen.dart';
import 'course_screen.dart';
import 'creative_industry_category_screen.dart';
import 'development_category_screen.dart';
import 'lifestyle_category_screen.dart';
import 'login_screen.dart';
import 'notification_screen.dart';
import 'office_productivity_category_screen.dart';
import 'popular_courses_screen.dart';
import 'purchase_screen.dart';
import 'search_screen.dart';
import 'self_improvement_category_screen.dart';
import 'splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBottomIndex = 0;
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

    Widget bodyContent;
    if (_currentBottomIndex == 1) {
      bodyContent = const SearchScreen();
    } else if (_currentBottomIndex == 2) {
      bodyContent = const CourseScreen();
    } else if (_currentBottomIndex == 3) {
      bodyContent = const PurchaseScreen();
    } else if (_currentBottomIndex == 4) {
      bodyContent = AccountScreen(
        onNavigateTab: (targetIndex) {
          setState(() {
            _currentBottomIndex = targetIndex;
          });
        },
        onLogout: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const SplashScreen(
                nextScreen: LoginScreen(),
              ),
            ),
            (route) => false,
          );
        },
      );
    } else {
      bodyContent = SafeArea(
        top: false,
        child: Column(
          children: [
            // 1. Header Marun tetap fixed di atas
            _buildHeader(),

            // 2. Konten halaman yang dapat di-scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Rekomendasi Untukmu (Horizontal Scrollable)
                    _buildSectionTitle('Rekomendasi Untukmu!'),
                    const SizedBox(height: 12),
                    _buildRecommendationBanners(),

                    const SizedBox(height: 24),

                    // Cari Pelajaran Favoritmu Disini
                    _buildSectionTitle('Cari Pelajaran Favoritmu Disini'),
                    const SizedBox(height: 12),
                    _buildSubjectGrid(),

                    const SizedBox(height: 24),

                    // Bagian Kategori
                    _buildCategorySection(),

                    const SizedBox(height: 24),

                    // Bagian Kursus Populer Terbaik (Horizontal Scrollable)
                    _buildPopularCoursesSection(),

                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: bodyContent,
      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(),
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
        bottom: 16,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Selamat datang, Budi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationScreen(),
                ),
              );
            },
          ),
        ],
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
        ),
      ),
    );
  }

  // --- Rekomendasi Banner (Scroll Horizontal) ---
  Widget _buildRecommendationBanners() {
    final banners = [
      'assets/images/banner_matematika.png',
      'assets/images/banner_kimia.png',
      'assets/images/banner_inggris.png',
    ];

    return SizedBox(
      height: 148,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: banners.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              banners[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  // --- Grid Pelajaran Favorit ---
  Widget _buildSubjectGrid() {
    final subjects = [
      {'name': 'Matematika', 'icon': 'assets/images/icon_matematika.png'},
      {'name': 'B. Indonesia', 'icon': 'assets/images/flag_indonesia.png'},
      {'name': 'Fisika', 'icon': 'assets/images/icon_fisika_v2.png'},
      {'name': 'B. inggris', 'icon': 'assets/images/flag_uk.png'},
      {'name': 'Kimia', 'icon': 'assets/images/icon_kimia.png'},
      {'name': 'Biologi', 'icon': 'assets/images/icon_biologi.png'},
      {'name': 'Lainnya', 'icon': 'assets/images/icon_lainnya.png'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Baris 1: 4 Pelajaran
          Row(
            children: subjects
                .sublist(0, 4)
                .map((s) => Expanded(child: _buildSubjectItem(s)))
                .toList(),
          ),
          const SizedBox(height: 18),
          // Baris 2: 3 Pelajaran + Spacer
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...subjects.sublist(4, 7).map(
                    (s) => Expanded(
                      child: _buildSubjectItem(s),
                    ),
                  ),
              const Expanded(child: SizedBox()), // Ruang kosong agar sejajar
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectItem(Map<String, String> subject) {
    return InkWell(
      onTap: () {
        if (subject['name'] == 'Lainnya') {
          _showOtherSubjectsBottomSheet();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Membuka kategori ${subject['name']}')),
          );
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 38,
            width: 38,
            child: Image.asset(
              subject['icon']!,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subject['name']!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // --- Bottom Sheet Pelajaran Lainnya ---
  void _showOtherSubjectsBottomSheet() {
    final mainSubjectsWithoutOther = [
      {'name': 'Matematika', 'icon': 'assets/images/icon_matematika.png'},
      {'name': 'B. Indonesia', 'icon': 'assets/images/flag_indonesia.png'},
      {'name': 'Fisika', 'icon': 'assets/images/icon_fisika_v2.png'},
      {'name': 'B. inggris', 'icon': 'assets/images/flag_uk.png'},
      {'name': 'Kimia', 'icon': 'assets/images/icon_kimia.png'},
      {'name': 'Biologi', 'icon': 'assets/images/icon_biologi.png'},
    ];

    final otherSubjects = [
      {'name': 'Ekonomi', 'icon': 'assets/images/icon_ekonomi.png'},
      {'name': 'Sosiologi', 'icon': 'assets/images/icon_sosiologi.png'},
      {'name': 'Geografi', 'icon': 'assets/images/icon_geografi.png'},
      {'name': 'PKN', 'icon': 'assets/images/icon_pkn.png'},
      {'name': 'Informatika', 'icon': 'assets/images/icon_informatika.png'},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Kotak Atas: 6 Mata Pelajaran Utama (Tanpa tombol Lainnya)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    // Baris 1: Matematika, B. Indonesia, Fisika, B. Inggris
                    Row(
                      children: mainSubjectsWithoutOther
                          .sublist(0, 4)
                          .map((s) => Expanded(child: _buildSubjectItem(s)))
                          .toList(),
                    ),
                    const SizedBox(height: 18),
                    // Baris 2: Kimia, Biologi
                    Row(
                      children: [
                        Expanded(child: _buildSubjectItem(mainSubjectsWithoutOther[4])),
                        Expanded(child: _buildSubjectItem(mainSubjectsWithoutOther[5])),
                        const Expanded(child: SizedBox()),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 2. Judul: Pelajaran Lainnya
              const Text(
                'Pelajaran Lainnya',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 14),

              // 3. Kotak Bawah: 5 Mata Pelajaran Lainnya
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    // Baris 1: Ekonomi, Sosiologi, Geografi, PKN
                    Row(
                      children: otherSubjects
                          .sublist(0, 4)
                          .map((s) => Expanded(child: _buildSubjectItem(s)))
                          .toList(),
                    ),
                    const SizedBox(height: 18),
                    // Baris 2: Informatika
                    Row(
                      children: [
                        Expanded(child: _buildSubjectItem(otherSubjects[4])),
                        const Expanded(child: SizedBox()),
                        const Expanded(child: SizedBox()),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- Kategori Pill Chips (Hanya 2 baris, scroll ke samping) ---
  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryListScreen(
                        onNavigateTab: (targetIndex) {
                          setState(() {
                            _currentBottomIndex = targetIndex;
                          });
                        },
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Hanya 2 baris dengan fungsi scroll ke samping
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Baris 1
              Row(
                children: [
                  _buildCategoryChip('Akademik'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Pengembangan Pribadi'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Pengembangan'),
                ],
              ),
              const SizedBox(height: 10),
              // Baris 2
              Row(
                children: [
                  _buildCategoryChip('Komputer & Jaringan'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Produktivitas Kantor'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Industri Kreatif'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String title) {
    return InkWell(
      onTap: () {
        if (title == 'Akademik') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AcademicCategoryScreen(
                onNavigateTab: (targetIndex) {
                  setState(() {
                    _currentBottomIndex = targetIndex;
                  });
                },
              ),
            ),
          );
        } else if (title == 'Pengembangan Pribadi') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SelfImprovementCategoryScreen(
                onNavigateTab: (targetIndex) {
                  setState(() {
                    _currentBottomIndex = targetIndex;
                  });
                },
              ),
            ),
          );
        } else if (title == 'Pengembangan') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DevelopmentCategoryScreen(
                onNavigateTab: (targetIndex) {
                  setState(() {
                    _currentBottomIndex = targetIndex;
                  });
                },
              ),
            ),
          );
        } else if (title == 'Gaya Hidup') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LifestyleCategoryScreen(
                onNavigateTab: (targetIndex) {
                  setState(() {
                    _currentBottomIndex = targetIndex;
                  });
                },
              ),
            ),
          );
        } else if (title == 'Komputer & Jaringan') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ComputerNetworkCategoryScreen(
                onNavigateTab: (targetIndex) {
                  setState(() {
                    _currentBottomIndex = targetIndex;
                  });
                },
              ),
            ),
          );
        } else if (title == 'Produktivitas Kantor') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OfficeProductivityCategoryScreen(
                onNavigateTab: (targetIndex) {
                  setState(() {
                    _currentBottomIndex = targetIndex;
                  });
                },
              ),
            ),
          );
        } else if (title == 'Industri Kreatif') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CreativeIndustryCategoryScreen(
                onNavigateTab: (targetIndex) {
                  setState(() {
                    _currentBottomIndex = targetIndex;
                  });
                },
              ),
            ),
          );
        } else if (title == 'Bisnis') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BusinessCategoryScreen(
                onNavigateTab: (targetIndex) {
                  setState(() {
                    _currentBottomIndex = targetIndex;
                  });
                },
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Kategori $title dipilih')),
          );
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1.2),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // --- Kursus Populer Terbaik (Scroll Horizontal) ---
  Widget _buildPopularCoursesSection() {
    final courses = [
      {
        'title': 'Belajar Pemrograman Python',
        'author': 'Programmer Zaman Now',
        'image': 'assets/images/course_python.png',
      },
      {
        'title': 'Belajar Photoshop Untuk Pemula',
        'author': 'Adil',
        'image': 'assets/images/course_photoshop.png',
      },
      {
        'title': 'Excel Untuk Data Analys',
        'author': 'HaloTech academy',
        'image': 'assets/images/course_excel.png',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(text: 'Kursus '),
                      TextSpan(
                        text: 'Populer ',
                        style: TextStyle(color: primaryColor),
                      ),
                      TextSpan(text: 'Terbaik'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PopularCoursesScreen(
                        onNavigateTab: (targetIndex) {
                          setState(() {
                            _currentBottomIndex = targetIndex;
                          });
                        },
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Lainnya',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 185,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: courses.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final c = courses[index];
              return Container(
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
                            ),
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
    );
  }

  // --- Bottom Navigation Bar ---
  Widget _buildBottomNavigationBar() {
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
        currentIndex: _currentBottomIndex,
        onTap: (index) {
          setState(() {
            _currentBottomIndex = index;
          });
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
              color: _currentBottomIndex == 0 ? primaryColor : Colors.black87,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_search.png',
              width: 22,
              height: 22,
              color: _currentBottomIndex == 1 ? primaryColor : Colors.black87,
            ),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_course.png',
              width: 22,
              height: 22,
              color: _currentBottomIndex == 2 ? primaryColor : Colors.black87,
            ),
            label: 'Kursus',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_cart.png',
              width: 22,
              height: 22,
              color: _currentBottomIndex == 3 ? primaryColor : Colors.black87,
            ),
            label: 'Pembelian',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nav_profile.png',
              width: 22,
              height: 22,
              color: _currentBottomIndex == 4 ? primaryColor : Colors.black87,
            ),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
