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
    tagline:
        'Mempelajari cara mengelola kecemasan dan menghadapi pikiran dengan lebih tenang.',
    instructor: 'Greatmind',
    price: 30000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/banner_filosofi_anti_cemas.png',
    whatYouWillLearn: [
      'Filosofi Anti Cemas',
      'Belajar Filosofi',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Pelajari filosofi Stoikisme sebagai panduan praktis untuk mengelola kecemasan dan menghadapi dinamika pikiran secara lebih tenang. Dipandu oleh Greatmind, kursus ini mengajak Anda memahami prinsip dikotomi kendali membedakan hal-hal yang dapat kita kontrol dan yang berada di luar kendali kita guna membangun ketahanan mental, kedamaian batin, serta kecerdasan emosional dalam kehidupan sehari-hari.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),

  // --- PRODUKTIVITAS KANTOR ---
  const CourseModel(
    id: 'excel_nol',
    title: 'Belajar Excel Dari Nol',
    category: 'Produktivitas Kantor',
    tagline:
        'Mempelajari dasar Microsoft Excel, mulai dari pengolahan data hingga penggunaan rumus sederhana.',
    instructor: 'Ignasius Ryan',
    price: 60000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_excel_nol.png',
    whatYouWillLearn: [
      'Excel Hingga Bisa',
      'Belajar Excel',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Kuasai dasar-dasar pengolahan data digital melalui materi Belajar Excel Dari Nol. Kursus ini dirancang khusus untuk membimbing Anda memahami penggunaan perangkat lunak Microsoft Excel secara terstruktur, mulai dari pengenalan antarmuka hingga penerapan rumus-rumus esensial yang mudah dipahami.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'manajemen_waktu',
    title: 'Manajemen Waktu',
    category: 'Produktivitas Kantor',
    tagline:
        'Mempelajari cara mengatur waktu agar kegiatan lebih teratur dan produktif.',
    instructor: 'Satu Persen-Indonesian Life School',
    price: 30000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_manajemen_waktu.png',
    whatYouWillLearn: [
      'Manajemen Waktu Hingga Bisa',
      'Belajar Manajemen Waktu',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Pelajari cara mengelola waktu dengan efektif agar kegiatan harian Anda menjadi lebih teratur dan produktif. Dipandu oleh Satu Persen, kursus ini membagikan teknik praktis untuk menentukan skala prioritas, mengalahkan kebiasaan menunda-nunda, serta menciptakan keseimbangan antara pekerjaan dan kehidupan pribadi tanpa merasa burnout.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),

  // --- KOMPUTER & JARINGAN ---
  const CourseModel(
    id: 'hardware_software',
    title: 'Pengenalan Hardware dan Software',
    category: 'Komputer & Jaringan',
    tagline:
        'Mengenal perangkat keras dan perangkat lunak serta fungsinya pada komputer.',
    instructor: 'Kriting Coding',
    price: 20000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_hardware_software.png',
    whatYouWillLearn: [
      'Hardware & Software Hingga Bisa',
      'Belajar Hardware',
      'Belajar Software',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Pahami dasar-dasar dunia komputer melalui materi Pengenalan Hardware dan Software. Kursus ini dirancang khusus untuk memberikan pemahaman dasar yang kuat, interaktif, dan mudah dipahami mengenai komponen fisik serta sistem program yang menjalankan sistem komputer.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
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
    instructor: 'BodyFit By Bagus',
    price: 45000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_yoga.png',
    whatYouWillLearn: [
      'Pose Yoga Dasar & Peregangan',
      'Teknik Pernapasan Pranayama',
      'Step by Step Sampai Bisa',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Kelas yoga santai yang cocok untuk meredakan ketegangan otot setelah seharian bekerja di depan laptop. Dipandu step by step oleh BodyFit By Bagus agar pemula dapat mengikuti gerakan dengan aman dan efektif.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'program_gym',
    title: 'Program Gym Untuk Pemula',
    category: 'Gaya Hidup',
    tagline:
        'Mempelajari teknik latihan gym dasar untuk membangun kekuatan dan menjaga kebugaran tubuh.',
    instructor: 'Dunia Ade Rai',
    price: 40000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_program_gym.png',
    whatYouWillLearn: [
      'Gerakan Gym',
      'Belajar Gym',
      'Belajar Mind Muscle',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan kekuatan fisik dan bentuk tubuh ideal Anda melalui kursus Program Gym Untuk Pemula. Dipandu oleh pakar fitness, program ini dirancang khusus untuk membantu pemula memahami dasar-dasar latihan beban serta teknik gym secara aman, terstruktur, dan efektif.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
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
    thumbnailAsset: 'assets/images/banner_kursus_matematika.png',
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
    thumbnailAsset: 'assets/images/banner_kursus_kimia.png',
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
    thumbnailAsset: 'assets/images/banner_kursus_inggris.png',
    whatYouWillLearn: [
      'Speaking Fluency & Pronunciation',
      'Struktur Tenses & Writing Dasar',
    ],
    description:
        'Tingkatkan rasa percaya diri berbicara bahasa Inggris dalam situasi formal maupun kasual.',
  ),
  const CourseModel(
    id: 'termodinamika',
    title: 'Termodinamika',
    category: 'Akademik',
    tagline:
        'Mempelajari hubungan antara kalor, energi, suhu, dan usaha dalam suatu sistem.',
    instructor: 'Edcent',
    price: 80000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/banner_termodinamika.png',
    whatYouWillLearn: [
      'Termodinamika Hingga Bisa',
      'Belajar Termodinamika',
      'Belajar Materi Dinamika',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman fisika Anda secara mendalam bersama tutor ahli dari Eduosmo. Kursus ini dirancang khusus untuk siswa SMA serta persiapan UTBK SBMPTN dan SIMAK UI. Materi disesuaikan secara personal, mulai dari pemahaman konsep dasar hukum termodinamika, proses gas ideal, hingga trik cepat menyelesaikan soal-soal ujian tingkat tinggi untuk meraih prestasi terbaik!',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'sosiologi_tka',
    title: 'Materi Sosiologi TKA-SMA',
    category: 'Akademik',
    tagline:
        'Mempelajari konsep sosiologi, interaksi sosial, dan fenomena masyarakat untuk persiapan TKA-SMA.',
    instructor: 'Laksana UTBK Rangkuman Audio',
    price: 90000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_sosiologi.png',
    whatYouWillLearn: [
      'Sosiologi Hingga Bisa',
      'Belajar Biologi',
      'Belajar Sosiologi TKA',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman sosiologi Anda secara mendalam bersama tutor ahli dari Eduosmo. Kursus ini dirancang khusus untuk membantu Anda menguasai materi Sosiologi TKA-SMA dengan metode pembelajaran yang praktis dan fleksibel. Dapatkan bimbingan terstruktur mulai dari konsep dasar hingga pembahasan soal-soal ujian untuk membangun kepercayaan diri dan meraih nilai maksimal!',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'biologi_sel_molekuler',
    title: 'Dasar Biologi Sel & Molekuler',
    category: 'Akademik',
    tagline:
        'Mempelajari konsep biologi secara mendalam untuk mempersiapkan kompetisi olimpiade sains.',
    instructor: 'Aldi Yazri',
    price: 90000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_biologi.png',
    whatYouWillLearn: [
      'Biologi Hingga Bisa',
      'Belajar Biologi',
      'Belajar Sel & Molekuler',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman biologi Anda secara mendalam bersama tutor ahli dari Eduosmo. Kursus privat ini dirancang khusus untuk persiapan Olimpiade Biologi dengan pembahasan terstruktur mengenai struktur sel, fungsi organel, hingga mekanisme biologi molekuler. Anda akan dibimbing memahami konsep-konsep kompleks secara sistematis untuk membangun kepercayaan diri dan menguasai soal-soal olimpiade dengan maksimal!',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'pemahaman_bacaan_menulis',
    title: 'Pemahaman Bacaan Dan Menulis UTBK',
    headerTitle: 'Pemahaman Bacaan Dan Menulis',
    category: 'Akademik',
    tagline:
        'Melatih kemampuan memahami bacaan, menganalisis teks, dan menyusun kalimat secara efektif untuk UTBK.',
    instructor: 'Integral Education',
    price: 95000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_pemahaman_bacaan.png',
    whatYouWillLearn: [
      'PBM Hingga Bisa',
      'Belajar PBM',
      'Belajar Materi PBM',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman matematika Anda secara mendalam dengan bimbingan tutor ahli dari Eduosmo. Kursus privat ini menawarkan pendekatan pembelajaran yang sangat personal, di mana materi disesuaikan secara dinamis dengan kurikulum sekolah atau kebutuhan spesifik Anda. Mulai dari memperkuat fondasi aritmatika hingga menguasai topik-topik kompleks seperti kalkulus, kami siap membantu Anda membangun kepercayaan diri dan mencapai prestasi.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'gagasan_pendiri_negara',
    title: 'Gagasan Pendiri Negara',
    category: 'Akademik',
    tagline:
        'Mempelajari gagasan para pendiri negara dalam merumuskan dasar negara Indonesia.',
    instructor: 'Tama Edukasi',
    price: 60000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/banner_gagasan_pendiri_negara.png',
    whatYouWillLearn: [
      'PKN Hingga Bisa',
      'Belajar PKN',
      'Belajar materi PKN',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman Pendidikan Pancasila dan Kewarganegaraan (PKn) Anda bersama tutor ahli dari Eduosmo. Kursus privat ini dirancang untuk membantu Anda menguasai materi Gagasan Pendiri Negara tentang Dasar Negara serta sejarah penting perumusan Pancasila oleh BPUPKI & PPKI secara mendalam dan terstruktur.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'oop_informatika',
    title: 'OOP-Informatika-SMA/K',
    category: 'Akademik',
    tagline:
        'Mempelajari konsep pemrograman berorientasi objek dalam Informatika SMA/SMK.',
    instructor: 'Kelas Terbuka',
    price: 60000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_oop.png',
    whatYouWillLearn: [
      'OOP Hingga Bisa',
      'Belajar Informatika',
      'Belajar OOP',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman Informatika dan logika pemrograman Anda lewat materi Object-Oriented Programming (OOP) menggunakan C++. Kursus privat ini dirancang khusus untuk membimbing Anda secara bertahap, mulai dari pemahaman konsep dasar hingga penerapan praktis yang sistematis dan mudah dipahami.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'kebijakan_fiskal_moneter',
    title: 'Kebijakan Fiskal dan Moneter',
    category: 'Akademik',
    tagline:
        'Mempelajari kebijakan pemerintah dalam mengatur pajak, pengeluaran, dan jumlah uang yang beredar.',
    instructor: 'Roeang Belajar',
    price: 70000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/banner_fiskal.png',
    whatYouWillLearn: [
      'Kebijakan Ekonomi Hingga Bisa',
      'Belajar Kebijakan Ekonomi',
      'Belajar Fiskal Dan Moneter',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman ekonomi Anda secara mendalam bersama tutor ahli dari Eduosmo. Kursus privat ini dirancang untuk membantu Anda menguasai konsep dasar hingga penerapan kebijakan fiskal dan moneter, mulai dari pengertian, tujuan, hingga instrumen yang digunakan. Dapatkan bimbingan terstruktur untuk memperkuat pemahaman materi sekolah maupun persiapan ujian agar Anda dapat meraih prestasi terbaik!',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'geografi_sma_tka',
    title: 'Materi Geografi SMA-TKA',
    category: 'Akademik',
    tagline:
        'Mempelajari fenomena alam, lingkungan, dan interaksi manusia dengan ruang untuk persiapan TKA-SMA.',
    instructor: 'Edcent',
    price: 80000,
    rating: 4.0,
    thumbnailAsset: 'assets/images/banner_geografi.png',
    whatYouWillLearn: [
      'Geografi Hingga Bisa',
      'Belajar Geografi',
      'Belajar Geografi TKA',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman geografi Anda secara mendalam bersama tutor ahli dari Eduosmo. Kursus ini dirancang khusus untuk siswa SMA serta persiapan TKA SMA dengan pembahasan menyeluruh mengenai dasar-dasar pemetaan (kartografi), interpretasi citra penginderaan jauh, hingga analisis Sistem Informasi Geografi (SIG). Dapatkan bimbingan terstruktur untuk menguasai konsep dan tipe-tipe soal ujian demi meraih prestasi terbaik!',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
  ),
  const CourseModel(
    id: 'termokimia',
    title: 'Termokimia',
    headerTitle: 'Termokimia-Materi Kelas 11',
    category: 'Akademik',
    tagline:
        'Mempelajari perubahan kalor dalam reaksi kimia dan perubahan fisika.',
    instructor: 'Edcent',
    price: 90000,
    rating: 5.0,
    thumbnailAsset: 'assets/images/banner_termokimia.png',
    whatYouWillLearn: [
      'Termokimia Hingga Bisa',
      'Belajar Termokima',
      'Belajar matematika',
    ],
    includes: [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    description:
        'Tingkatkan pemahaman Kimia Anda pada materi Termokimia dengan bimbingan tutor ahli dari Edcent. Kursus ini dirancang khusus untuk siswa SMA Kelas 11 guna memahami perubahan kalor dalam reaksi kimia dan perubahan fisika secara mendalam. Mulai dari konsep reaksi eksoterm dan endoterm hingga perhitungan matematis persamaan termokimia, kami siap membantu Anda menguasai materi dengan mudah dan percaya diri.',
    reviews: [
      CourseReview(
        userName: 'Kakashi Hatake',
        rating: 5.0,
        comment: 'Kursusnya Menarik.',
      ),
    ],
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
  } else if (normalizedTitle == 'termodinamika-fisika sma') {
    normalizedTitle = 'termodinamika';
  } else if (normalizedTitle == 'termokimia-materi kelas 11') {
    normalizedTitle = 'termokimia';
  } else if (normalizedTitle == 'gerakan yoga untuk pemula') {
    normalizedTitle = 'gerakan yoga pemula';
  } else if (normalizedTitle == 'pemahaman bacaan & literasi kritis' ||
      normalizedTitle == 'pemahaman bacaan dan menulis') {
    normalizedTitle = 'pemahaman bacaan dan menulis utbk';
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
