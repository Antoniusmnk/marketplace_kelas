class CourseReview {
  final String userName;
  final double rating;
  final String comment;

  const CourseReview({
    required this.userName,
    required this.rating,
    required this.comment,
  });
}

class CourseModel {
  final String id;
  final String title;
  final String category;
  final String tagline;
  final String instructor;
  final int price;
  final double rating;
  final String thumbnailAsset;
  final List<String> whatYouWillLearn;
  final List<String> includes;
  final String description;
  final List<CourseReview> reviews;

  const CourseModel({
    required this.id,
    required this.title,
    required this.category,
    this.tagline = '',
    required this.instructor,
    required this.price,
    required this.rating,
    required this.thumbnailAsset,
    this.whatYouWillLearn = const [],
    this.includes = const [
      'Video Pendukung',
      'File Materi',
      'Akses Seumur Hidup',
      'Sertifikat Penyelesaian',
    ],
    this.description = '',
    this.reviews = const [],
  });

  // Format harga ke Rupiah: e.g. 30000 -> "Rp. 30.000"
  String get formattedPrice {
    final str = price.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(str[i]);
    }
    return 'Rp. ${buffer.toString()}';
  }
}
