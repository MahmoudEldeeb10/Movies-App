import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/dio_client.dart'; // ✅
import 'package:movies_app/features/movies/data/services/movie_service.dart';
import 'package:movies_app/features/movies/presentation/manager/cubit/movie_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  final MovieService service = MovieService(DioClient.createDio()); // ✅

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