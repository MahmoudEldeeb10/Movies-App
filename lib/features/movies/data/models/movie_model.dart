class MovieModel {
  final int id;

  final String title;
  final String? language;
  final String image;
  final double rating;
  final String overview;

  MovieModel({
    required this.title,
    required this.language,
    required this.image,
    required this.rating,
    required this.overview,
    required this.id,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,

      title: json['title'] ?? '',
      language: json['original_language'] ?? '',
      image: json['poster_path'] ?? '',
      rating: (json['vote_average'] ?? 0).toDouble(),
      overview: json['overview'] ?? '',
    );
  }
}
