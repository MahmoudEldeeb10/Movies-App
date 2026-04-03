import 'package:movies_app/features/movies/data/models/movie_model.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesSuccess extends MoviesState {
  final List<MovieModel> movies;

  MoviesSuccess(this.movies);
}

class MoviesFailure extends MoviesState {
  final String message;

  MoviesFailure(this.message);
}
