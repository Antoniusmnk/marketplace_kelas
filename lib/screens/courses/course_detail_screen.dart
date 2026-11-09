import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/course_model.dart';
import 'widgets/cart_success_bottom_sheet.dart';
import 'widgets/buy_now_bottom_sheet.dart';
import '../main/home_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  final CourseModel course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  static const Color primaryColor = Color(0xFF800E13);
  bool _isFavorite = false;

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
            // 1. Header Marun dengan Tombol Kembali & Judul Kelas
            _buildHeader(context),

            // 2. Konten Halaman yang Dapat Di-scroll
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // A. Banner / Thumbnail Utama
                    _buildBanner(),
                    const SizedBox(height: 16),

                    // B. Judul & Tagline Kelas
                    Text(
                      widget.course.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    if (widget.course.tagline.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        widget.course.tagline,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF333333),
                          fontFamily: 'Poppins',
                          height: 1.35,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),

                    // C. Rating Bintang
                    _buildRatingStars(widget.course.rating),
                    const SizedBox(height: 8),

                    // D. Harga & Pembuat
                    Text(
                      widget.course.formattedPrice,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontFamily: 'Poppins',
                          color: Color(0xFF555555),
                        ),
                        children: [
                          const TextSpan(text: 'Dibuat oleh '),
                          TextSpan(
                            text: widget.course.instructor,
                            style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // E. 3 Tombol Aksi (Beli Sekarang, Keranjang, Wishlist)
                    _buildActionButtons(),
                    const SizedBox(height: 24),

                    // F. Section: Yang akan Dipelajari
                    if (widget.course.whatYouWillLearn.isNotEmpty) ...[
                      _buildWhatYouWillLearnSection(),
                      const SizedBox(height: 24),
                    ],

                    // G. Section: Kursus ini Mencakup
                    if (widget.course.includes.isNotEmpty) ...[
                      _buildIncludesSection(),
                      const SizedBox(height: 24),
                    ],

                    // H. Section: Deskripsi
                    if (widget.course.description.isNotEmpty) ...[
                      _buildDescriptionSection(),
                      const SizedBox(height: 24),
                    ],

                    // I. Section: Masukan (Rating Breakdown & Ulasan)
                    _buildReviewSection(),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar Terintegrasi
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
          Expanded(
            child: Text(
              widget.course.displayHeaderTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Banner / Thumbnail Produk ---
  Widget _buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        height: 195,
        color: Colors.grey.shade200,
        child: Image.asset(
          widget.course.thumbnailAsset,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Center(
            child: Icon(
              Icons.image_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }

  // --- Bintang Rating ---
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

  // --- 3 Tombol Aksi (Beli Sekarang, Keranjang, Wishlist) ---
  Widget _buildActionButtons() {
    return Row(
      children: [
        // 1. Tombol Beli Sekarang
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                BuyNowBottomSheet.show(context, course: widget.course);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: const Text(
                'Beli Sekarang',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        // 2. Tombol Keranjang
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 44,
            child: OutlinedButton(
              onPressed: () {
                CartSuccessBottomSheet.show(context);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                elevation: 0,
                side: const BorderSide(color: Colors.black54, width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: const Text(
                'Keranjang',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        // 3. Tombol Wishlist / Favorit
        InkWell(
          onTap: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _isFavorite
                      ? '${widget.course.title} ditambahkan ke Favorit.'
                      : '${widget.course.title} dihapus dari Favorit.',
                  style: const TextStyle(fontFamily: 'Poppins'),
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black54, width: 1.2),
            ),
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: primaryColor,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }

  // --- Section: Yang akan Dipelajari ---
  Widget _buildWhatYouWillLearnSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Yang akan Dipelajari',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 10),
        ...widget.course.whatYouWillLearn.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.done_all,
                  size: 20,
                  color: primaryColor,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // --- Section: Kursus ini Mencakup ---
  Widget _buildIncludesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kursus ini Mencakup',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 10),
        ...widget.course.includes.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 13.5,
                color: Color(0xFF333333),
                fontFamily: 'Poppins',
              ),
            ),
          );
        }),
      ],
    );
  }

  // --- Section: Deskripsi ---
  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Deskripsi',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.course.description,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF333333),
            fontFamily: 'Poppins',
            height: 1.45,
          ),
        ),
      ],
    );
  }

  // --- Section: Masukan (Rating Breakdown & Ulasan) ---
  Widget _buildReviewSection() {
    final reviews = widget.course.reviews.isNotEmpty
        ? widget.course.reviews
        : const [
            CourseReview(
              userName: 'Kakashi Hatake',
              rating: 5.0,
              comment: 'Kursusnya Menarik.',
            ),
          ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Masukan',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 14),

        // Diagram Batang Persentase Rating 80%
        _buildRatingBar(percentage: 0.8, starCount: 5, label: '80%'),
        const SizedBox(height: 8),

        // Diagram Batang Persentase Rating 60%
        _buildRatingBar(percentage: 0.6, starCount: 4, label: '60%'),
        const SizedBox(height: 18),

        // Ulasan Pengguna
        ...reviews.map((rev) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rev.userName,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (idx) {
                    return Icon(
                      Icons.star,
                      size: 13,
                      color: idx < rev.rating
                          ? const Color(0xFFFFC107)
                          : const Color(0xFFD6D6D6),
                    );
                  }),
                ),
                const SizedBox(height: 4),
                Text(
                  rev.comment,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF333333),
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // --- Widget Bilah Persentase Rating Berbingkai ---
  Widget _buildRatingBar({
    required double percentage,
    required int starCount,
    required String label,
  }) {
    return Row(
      children: [
        // Kotak Progress Bar dengan Border Hitam Tipis
        Container(
          width: 175,
          height: 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black54, width: 1.1),
            color: Colors.white,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.horizontal(
                    left: const Radius.circular(2.5),
                    right: percentage >= 1.0
                        ? const Radius.circular(2.5)
                        : Radius.zero,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // 5 Bintang
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (idx) {
            return Icon(
              Icons.star,
              size: 14,
              color: idx < starCount
                  ? const Color(0xFFFFC107)
                  : const Color(0xFFD6D6D6),
            );
          }),
        ),
        const SizedBox(width: 6),

        // Label Persentase
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF555555),
            fontFamily: 'Poppins',
          ),
        ),
      ],
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => HomeScreen(initialIndex: index),
            ),
            (route) => false,
          );
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
