import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/courses_data.dart';
import '../courses/course_detail_screen.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

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

    final popularBanners = [
      {
        'title': 'Privat Matematika Profesional',
        'image': 'assets/images/banner_kursus_matematika.png',
        'id': 'matematika_profesional',
      },
      {
        'title': 'Kimia Versi Mudah Paham',
        'image': 'assets/images/banner_kursus_kimia.png',
        'id': 'kimia_mudah_paham',
      },
      {
        'title': 'Kursus Bahasa Inggris',
        'image': 'assets/images/banner_kursus_inggris.png',
        'id': 'kursus_bahasa_inggris',
      },
    ];

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

            // 2. Konten Halaman Pembelian
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),

                    // Tombol Kapsul Riwayat Pembelian (Pinkish/Cream dengan Border & Arrow)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Membuka Riwayat Pembelian...'),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE4C4C6), // Warna pinkish muda lembut
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF222222),
                              width: 1.2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/icon_history_book.png',
                                width: 26,
                                height: 26,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 14),
                              const Expanded(
                                child: Text(
                                  'Riwayat Pembelian',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.black87,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Seksi Keranjang
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Keranjang',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Empty State Keranjang (Ikon Keranjang Silang Abu-abu)
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/icon_cart_empty.png',
                            width: 50,
                            height: 48,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Belum ada kursus dikeranjang',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF777777),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Seksi Produk Populer Yang Sering Dibeli
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Produk Populer Yang Sering Dibeli',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Banner Slider Horizontal
                    SizedBox(
                      height: 148,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: popularBanners.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 14),
                        itemBuilder: (context, index) {
                          final item = popularBanners[index];
                          return InkWell(
                            onTap: () {
                              final course = getCourseById(item['id']!) ??
                                  findOrCreateCourse(item, 'Akademik');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CourseDetailScreen(course: course),
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
                    ),

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
}
