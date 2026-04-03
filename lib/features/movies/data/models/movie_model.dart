class MovieModel {
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
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] ?? '',
      subTitle: json['subTitle'] ?? '',
      image: json['poster_path'] ?? '',
      rating: (json['vote_average'] ?? 0).todouble(),
      overview: json['overview'] ?? '',
    );
  }
}
