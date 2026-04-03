import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/features/movies/data/services/movie_service.dart';
import 'package:movies_app/features/movies/presentation/manager/cubit/movie_state.dart';


class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  final MovieService service = MovieService(Dio());

  Future<void> fetchMovies() async {
    emit(MoviesLoading());

    try {
      final movies = await service.getMovies();
      emit(MoviesSuccess(movies));
    } catch (e) {
      emit(MoviesFailure(e.toString()));
    }
  }
}