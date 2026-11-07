import '../models/course_model.dart';

final List<CourseModel> allCourses = [
  // --- PENGEMBANGAN PRIBADI ---
  const CourseModel(
    id: 'pola_bicara',
    title: 'Pola Bicara terstruktur',
    category: 'Pengembangan Pribadi',
    tagline: 'Melatih kemampuan berbicara secara jelas, runtut, dan terarah.',
    instructor: 'Riko Abu Alfatif',
    price: 30000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/thumb_pola_bicara.png',
    whatYouWillLearn: [
      'Pola Bicara Terstruktur Hingga Bisa',
      'Belajar Self Improve',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan kemampuan komunikasi dan public speaking Anda melalui pelatihan Pola Bicara Terstruktur bersama Coach Riko Abu Alfatih. Pelatihan ini dirancang khusus untuk melatih Anda menyampaikan ide, gagasan, dan argumen secara jelas, runtut, dan terarah sehingga pesan yang Anda sampaikan mudah dipahami oleh pendengar.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'membangun_kebiasaan',
    title: 'Cara Jitu Membangun Kebiasaan',
    category: 'Pengembangan Pribadi',
    tagline: 'Mempelajari cara membentuk dan mempertahankan kebiasaan positif secara konsisten.',
    instructor: 'Maudy Ayunda',
    price: 45000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_membangun_kebiasaan.png',
    whatYouWillLearn: [
      'Membangun Kebiasaan',
      'Belajar Disiplin',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan kualitas hidup Anda dengan mempelajari cara membentuk dan mempertahankan kebiasaan positif secara konsisten. Dipandu langsung oleh Maudy Ayunda, kursus ini membagikan strategi praktis berbasis sains untuk merancang rutinitas harian yang efektif, mengatasi rasa malas, serta membangun mindset yang mendukung keberhasilan jangka panjang.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'filosofi_anti_cemas',
    title: 'Filosofi Anti Cemas',
    category: 'Pengembangan Pribadi',
    tagline: 'Menerapkan kebijaksanaan Stoikisme dalam menghadapi tekanan hidup.',
    instructor: 'Henry Manampiring',
    price: 45000,
    rating: 4.5,
    thumbnailAsset: 'assets/images/thumb_filosofi_anti_cemas.png',
    whatYouWillLearn: [
      'Konsep Dikotomi Kendali',
      'Menjaga Ketenangan Pikiran',
    ],
    description:
        'Belajar mengendalikan emosi dan mengatasi kecemasan berlebih dengan prinsip-prinsip filosofi teras untuk ketenangan batin sehari-hari.',
  ),

  // --- PRODUKTIVITAS KANTOR ---
  const CourseModel(
    id: 'excel_nol',
    title: 'Belajar Excel dari Nol',
    category: 'Produktivitas Kantor',
    tagline: 'Kuasai rumus dan fungsi esensial spreadsheet perkantoran.',
    instructor: 'Ignasius Ryan',
    price: 25000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/thumb_excel_nol.png',
    whatYouWillLearn: [
      'Rumus VLOOKUP, HLOOKUP, XLOOKUP',
      'Pivot Table dan Visualisasi Data',
    ],
    description:
        'Pelajari Microsoft Excel dari tingkat pemula hingga mahir untuk mengotomatisasi pekerjaan administrasi dan analisis data kantor.',
  ),
  const CourseModel(
    id: 'manajemen_waktu',
    title: 'Manajemen Waktu',
    category: 'Produktivitas Kantor',
    tagline: 'Teknik efektif mengelola prioritas dan mengatasi prokrastinasi.',
    instructor: 'Satu Persen - Indonesian Life School',
    price: 30000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/thumb_manajemen_waktu.png',
    whatYouWillLearn: [
      'Metode Time Blocking & Pomodoro',
      'Matriks Prioritas Eisenhower',
    ],
    description:
        'Tingkatkan efisiensi kerja dengan memahami cara menetapkan skala prioritas dan mengatur jadwal kerja tanpa burnout.',
  ),

  // --- KOMPUTER & JARINGAN ---
  const CourseModel(
    id: 'hardware_software',
    title: 'Pengenalan Hardware Dan Software',
    category: 'Komputer & Jaringan',
    tagline: 'Memahami arsitektur perangkat keras dan sistem perangkat lunak.',
    instructor: 'Kriting Coding',
    price: 25000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/thumb_hardware_software.png',
    whatYouWillLearn: [
      'Komponen Utama Motherboard, CPU, RAM',
      'Dasar Sistem Operasi & Troubleshooting',
    ],
    description:
        'Fondasi penting bagi siapa saja yang ingin memahami cara kerja komputer, perakitan PC, dan penanganan masalah dasar perangkat keras.',
  ),

  // --- INDUSTRI KREATIF ---
  const CourseModel(
    id: 'adobe_illustrator',
    title: 'Belajar Adobe Ilustrator Dari Nol',
    category: 'Industri Kreatif',
    tagline: 'Mempelajari dasar Adobe Illustrator untuk membuat desain grafis dan ilustrasi digital.',
    instructor: 'Channel Ruang Belajar',
    price: 120000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/banner_adobe_illustrator.png',
    whatYouWillLearn: [
      'Ai Hingga Bisa',
      'Belajar Ai',
      'Belajar Adobe  Dasar',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Kuasai keterampilan desain grafis dan ilustrasi digital melalui kelas Belajar Adobe Illustrator Dari Nol. Kursus ini dirancang khusus untuk membimbing pemula dalam memahami penggunaan perangkat lunak Adobe Illustrator secara terstruktur, mulai dari pengenalan alat-alat dasar hingga pembuatan karya visual yang profesional.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),

  // --- PENGEMBANGAN (DEVELOPMENT) ---
  const CourseModel(
    id: 'dasar_pemrograman',
    title: 'Dasar Pemrograman',
    category: 'Pengembangan',
    tagline: 'Mempelajari konsep dasar pemrograman, logika, dan penulisan kode.',
    instructor: 'Edcent',
    price: 90000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_dasar_pemrograman.png',
    whatYouWillLearn: [
      'Pemrograman dari nol',
      'Belajar HTML',
      'Belajar CSS',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Pelajari fondasi utama dunia pemrograman mulai dari konsep dasar, logika, hingga teknik penulisan kode yang efektif. Kursus ini dirancang khusus untuk pemula yang ingin memahami bagaimana pemikiran komputasional bekerja serta siap melangkah ke jenjang pengembangan perangkat lunak secara percaya diri.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'tutorial_mysql',
    title: 'Tutorial MySQL Database',
    category: 'Pengembangan',
    tagline: 'Mengelola basis data relasional dengan perintah SQL terstruktur.',
    instructor: 'Programmer Zaman Now',
    price: 60000,
    rating: 4.5,
    thumbnailAsset: 'assets/images/thumb_mysql.png',
    whatYouWillLearn: [
      'Query DDL, DML, DCL',
      'Relasi Tabel & Indexing',
    ],
    description:
        'Kuasai MySQL untuk mengelola data aplikasi modern secara efisien, aman, dan siap integrasi backend.',
  ),

  // --- GAYA HIDUP (LIFESTYLE) ---
  const CourseModel(
    id: 'kalistenik_pemula',
    title: 'Kalistenik Untuk Pemula',
    category: 'Gaya Hidup',
    tagline: 'Mempelajari latihan kekuatan tubuh menggunakan berat badan sendiri bagi pemula.',
    instructor: 'Pierre Dallati',
    price: 40000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_kalistenik.png',
    whatYouWillLearn: [
      'Kalistenik Dari Nol',
      'Belajar Kalistenik',
      'Belajar Skill Kalistenik',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan kebugaran dan bentuk tubuh ideal Anda hanya dari rumah melalui kursus Kalistenik Untuk Pemula. Program ini dirancang khusus untuk membantu pemula menguasai latihan kekuatan menggunakan beban tubuh sendiri (bodyweight training) secara tepat, aman, dan bertahap.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'gerakan_yoga',
    title: 'Gerakan Yoga Pemula',
    category: 'Gaya Hidup',
    tagline: 'Menjaga fleksibilitas, pernapasan, dan ketenangan jiwa.',
    instructor: 'Yoganesia',
    price: 25000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/thumb_yoga.png',
    whatYouWillLearn: [
      'Pose Yoga Dasar & Peregangan',
      'Teknik Pernapasan Pranayama',
    ],
    description:
        'Kelas yoga santai yang cocok untuk meredakan ketegangan otot setelah seharian bekerja di depan laptop.',
  ),
  const CourseModel(
    id: 'program_gym',
    title: 'Program Gym Untuk Pemula',
    category: 'Gaya Hidup',
    tagline: 'Panduan lengkap latihan beban terstruktur dan pola nutrisi.',
    instructor: 'Coach Anton',
    price: 45000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/thumb_gym.png',
    whatYouWillLearn: [
      'Bentuk Gerakan Latihan Beban Benar',
      'Penyusunan Rencana Latihan Mingguan',
    ],
    description:
        'Hindari cedera dan maksimalkan hasil latihan di gym dengan program terstruktur khusus pemula.',
  ),

  // --- AKADEMIK ---
  const CourseModel(
    id: 'matematika_profesional',
    title: 'Privat Matematika Profesional',
    category: 'Akademik',
    tagline: 'Penyelesaian soal matematika cepat dan konsep logika kalkulus.',
    instructor: 'Jerome Polin',
    price: 45000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/pop_matematika.png',
    whatYouWillLearn: [
      'Aljabar Lanjutan & Trigonometri',
      'Trik Cepat Soal Ujian Nasional & UTBK',
    ],
    description:
        'Bimbingan belajar matematika intensif untuk memahami konsep inti tanpa sekadar menghafal rumus.',
  ),
  const CourseModel(
    id: 'kimia_mudah_paham',
    title: 'Kimia Versi Mudah Paham',
    category: 'Akademik',
    tagline: 'Belajar reaksi kimia, stoikiometri, dan tabel periodik dengan visual.',
    instructor: 'Ruang Kimia',
    price: 35000,
    rating: 4.5,
    thumbnailAsset: 'assets/images/pop_kimia.png',
    whatYouWillLearn: [
      'Stoikiometri & Hukum Dasar Kimia',
      'Ikatan Kimia dan Struktur Atom',
    ],
    description:
        'Penjelasan materi kimia sekolah menengah yang disederhanakan dengan analogi kehidupan sehari-hari.',
  ),
  const CourseModel(
    id: 'kursus_bahasa_inggris',
    title: 'Kursus Bahasa Inggris',
    category: 'Akademik',
    tagline: 'Percakapan aktif, grammar praktis, dan persiapan TOEFL/IELTS.',
    instructor: 'English Academy',
    price: 50000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/pop_inggris.png',
    whatYouWillLearn: [
      'Speaking Fluency & Pronunciation',
      'Struktur Tenses & Writing Dasar',
    ],
    description:
        'Tingkatkan rasa percaya diri berbicara bahasa Inggris dalam situasi formal maupun kasual.',
  ),
  const CourseModel(
    id: 'termodinamika_fisika',
    title: 'Termodinamika-Fisika SMA',
    category: 'Akademik',
    tagline: 'Hukum termodinamika dan siklus carnot dengan pembahasan soal.',
    instructor: 'Fisika Asyik',
    price: 30000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/thumb_termodinamika.png',
    whatYouWillLearn: [
      'Hukum I & II Termodinamika',
      'Perhitungan Efisiensi Mesin Kalor',
    ],
    description:
        'Kupas tuntas materi termodinamika fisika kelas 11 lengkap dengan simulasi grafik P-V.',
  ),
];

// Helper functions
CourseModel? getCourseById(String id) {
  try {
    return allCourses.firstWhere((c) => c.id == id);
  } catch (_) {
    return null;
  }
}

List<CourseModel> getCoursesByCategory(String category) {
  return allCourses.where((c) => c.category == category).toList();
}

CourseModel findOrCreateCourse(Map<String, dynamic> item, String defaultCategory) {
  final title = (item['title'] ?? '').toString();
  final rawTitle = title.toLowerCase().trim();
  String normalizedTitle = rawTitle;
  if (normalizedTitle == 'tips disiplin membangun kebiasaan') {
    normalizedTitle = 'cara jitu membangun kebiasaan';
  } else if (normalizedTitle == 'belajar adobe ilustrasi dari nol') {
    normalizedTitle = 'belajar adobe ilustrator dari nol';
  }

  return allCourses.firstWhere(
    (c) => c.title.toLowerCase().trim() == normalizedTitle,
    orElse: () {
      final rawPrice = item['price'] != null ? item['price'].toString() : '30000';
      final cleanPrice = int.tryParse(rawPrice.replaceAll(RegExp(r'[^0-9]'), '')) ?? 30000;
      final rawRating = item['rating'] != null ? double.tryParse(item['rating'].toString()) ?? 4.0 : 4.0;
      final author = (item['author'] ?? item['tutor'] ?? 'Instruktur Nexa').toString();
      final image = (item['image'] ?? item['thumbnail'] ?? 'assets/images/thumb_pola_bicara.png').toString();
      return CourseModel(
        id: title.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '_'),
        title: title,
        category: defaultCategory,
        tagline: 'Pelajari $title secara praktis dan aplikatif.',
        instructor: author,
        price: cleanPrice,
        rating: rawRating,
        thumbnailAsset: image,
        whatYouWillLearn: [
          'Pengenalan & Konsep Dasar $title',
          'Implementasi & Contoh Kasus',
        ],
        includes: const [
          'Video Pendukung',
          'File Materi',
          'Akses Seumur Hidup',
          'Sertifikat Penyelesaian',
        ],
        description: 'Materi pembelajaran komprehensif mengenai $title yang dipandu oleh $author.',
      );
    },
  );
}
