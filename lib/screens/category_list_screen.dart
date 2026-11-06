import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'academic_category_screen.dart';
import 'business_category_screen.dart';
import 'computer_network_category_screen.dart';
import 'creative_industry_category_screen.dart';
import 'development_category_screen.dart';
import 'lifestyle_category_screen.dart';
import 'office_productivity_category_screen.dart';
import 'self_improvement_category_screen.dart';

class CategoryListScreen extends StatelessWidget {
  final Function(int)? onNavigateTab;

  const CategoryListScreen({super.key, this.onNavigateTab});

  static const Color primaryColor = Color(0xFF800E13);

  final List<String> categories = const [
    'Akademik',
    'Pengembangan Pribadi',
    'Pengembangan',
    'Komputer & Jaringan',
    'Produktivitas Kantor',
    'Industri Kreatif',
    'Gaya Hidup',
    'Bisnis',
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
            // 1. Header Marun dengan Tombol Back & Judul 'Kategori'
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
                    'Kategori',
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

            // 2. Daftar Kategori Vertikal
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return InkWell(
                    onTap: () {
                      if (cat == 'Akademik') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AcademicCategoryScreen(
                              onNavigateTab: (targetIndex) {
                                Navigator.pop(context);
                                if (onNavigateTab != null) {
                                  onNavigateTab!(targetIndex);
                                }
                              },
                            ),
                          ),
                        );
                      } else if (cat == 'Pengembangan Pribadi' || cat == 'Self Improvement') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SelfImprovementCategoryScreen(
                              onNavigateTab: (targetIndex) {
                                Navigator.pop(context);
                                if (onNavigateTab != null) {
                                  onNavigateTab!(targetIndex);
                                }
                              },
                            ),
                          ),
                        );
                      } else if (cat == 'Pengembangan') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DevelopmentCategoryScreen(
                              onNavigateTab: (targetIndex) {
                                Navigator.pop(context);
                                if (onNavigateTab != null) {
                                  onNavigateTab!(targetIndex);
                                }
                              },
                            ),
                          ),
                        );
                      } else if (cat == 'Gaya Hidup') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LifestyleCategoryScreen(
                              onNavigateTab: (targetIndex) {
                                Navigator.pop(context);
                                if (onNavigateTab != null) {
                                  onNavigateTab!(targetIndex);
                                }
                              },
                            ),
                          ),
                        );
                      } else if (cat == 'Komputer & Jaringan') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ComputerNetworkCategoryScreen(
                              onNavigateTab: (targetIndex) {
                                Navigator.pop(context);
                                if (onNavigateTab != null) {
                                  onNavigateTab!(targetIndex);
                                }
                              },
                            ),
                          ),
                        );
                      } else if (cat == 'Produktivitas Kantor') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OfficeProductivityCategoryScreen(
                              onNavigateTab: (targetIndex) {
                                Navigator.pop(context);
                                if (onNavigateTab != null) {
                                  onNavigateTab!(targetIndex);
                                }
                              },
                            ),
                          ),
                        );
                      } else if (cat == 'Industri Kreatif') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CreativeIndustryCategoryScreen(
                              onNavigateTab: (targetIndex) {
                                Navigator.pop(context);
                                if (onNavigateTab != null) {
                                  onNavigateTab!(targetIndex);
                                }
                              },
                            ),
                          ),
                        );
                      } else if (cat == 'Bisnis') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BusinessCategoryScreen(
                              onNavigateTab: (targetIndex) {
                                Navigator.pop(context);
                                if (onNavigateTab != null) {
                                  onNavigateTab!(targetIndex);
                                }
                              },
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Halaman kategori $cat segera hadir')),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black87, width: 1.2),
                      ),
                      child: Text(
                        cat,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                      ),
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
      ),
    );
  }
}
