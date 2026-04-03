import 'package:dio/dio.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

class MovieService {
  final Dio dio;
  MovieService(this.dio);
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'a9ad3393eba6ee3461adb160f3cfd2dd';

  Future<List<MovieModel>> getMovies() async {
    final response = await dio.get(
      '$baseUrl/movie/popular',
      queryParameters: {'api_key': apiKey, 'language': 'en-US'},
    );
    List data = response.data['results'];

    return data.map((e) => MovieModel.fromJson(e)).toList();
  }
}
