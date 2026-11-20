import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/courses_data.dart';
import '../../models/course_model.dart';
import '../courses/course_detail_screen.dart';
import '../courses/widgets/buy_now_bottom_sheet.dart';
import 'purchase_history_screen.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  static const Color primaryColor = Color(0xFF800E13);

  final popularBanners = const [
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PurchaseHistoryScreen(),
                            ),
                          ).then((_) {
                            if (mounted) setState(() {});
                          });
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

                    const SizedBox(height: 16),

                    // Konten Keranjang (Empty State atau Daftar Kursus di Keranjang)
                    if (cartCourses.isEmpty)
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
                      )
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: cartCourses.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final item = cartCourses[index];
                          return _buildCartItem(item);
                        },
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
                              ).then((_) {
                                if (mounted) setState(() {});
                              });
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

  // --- Widget Kartu Kursus di Keranjang ---
  Widget _buildCartItem(CourseModel course) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail Kursus
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CourseDetailScreen(course: course),
              ),
            ).then((_) {
              if (mounted) setState(() {});
            });
          },
          borderRadius: BorderRadius.circular(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              course.thumbnailAsset,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 90,
                height: 90,
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.menu_book,
                  color: primaryColor,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Detail Kursus & Aksi
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Kursus
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CourseDetailScreen(course: course),
                    ),
                  ).then((_) {
                    if (mounted) setState(() {});
                  });
                },
                child: Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 2),

              // Instruktur / Pembuat
              Text(
                course.instructor,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF888888),
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 4),

              // Rating Bintang
              _buildRatingStars(course.rating),
              const SizedBox(height: 6),

              // Baris Harga, Tombol Hapus (Trash), dan Tombol Beli Sekarang
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Harga
                  Flexible(
                    child: Text(
                      course.formattedPrice,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Aksi: Icon Sampah & Tombol Beli Sekarang
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Tombol Sampah (Hapus dari Keranjang)
                      InkWell(
                        onTap: () {
                          setState(() {
                            removeFromCart(course);
                          });
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'assets/images/icon_trash.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => const Icon(
                              Icons.delete_outline,
                              color: primaryColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Tombol Beli Sekarang (Pill Marun)
                      ElevatedButton(
                        onPressed: () {
                          BuyNowBottomSheet.show(context, course: course).then((_) {
                            if (mounted) setState(() {});
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 0,
                          ),
                          minimumSize: const Size(0, 34),
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Beli Sekarang',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- Widget Bintang Rating ---
  Widget _buildRatingStars(double rating) {
    final fullStars = rating.floor();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 16,
          color: index < fullStars
              ? const Color(0xFFFFC107)
              : const Color(0xFFD6D6D6),
        );
      }),
    );
  }
}
