class MovieModel {
  final int id; // ← زود دي

  final String title;
  final String subTitle;
  final String image;
  final double rating;
  final String overview;

  MovieModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.rating,
    required this.overview,
    required this.id,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,

      title: json['title'] ?? '',
      subTitle: json['subTitle'] ?? '',
      image: json['poster_path'] ?? '',
      rating: (json['vote_average'] ?? 0).toDouble(),
      overview: json['overview'] ?? '',
    );
  }
}
