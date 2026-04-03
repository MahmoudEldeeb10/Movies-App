import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/presentation/manager/cubit/movie_cubit.dart';
import 'package:movies_app/features/movies/presentation/manager/cubit/movie_state.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/movies_gridview.dart';
import 'package:shimmer/shimmer.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies', style: AppTextStyles.title)),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: MoviesGridView(
                movies: List.generate(
                  2,
                  (index) => MovieModel(
                    id: 0,
                    title: 'Loading Title',
                    image: '',
                    rating: 0.0,
                    overview: '',
                    language: '',
                  ),
                ),
              ),
            );
          }
          if (state is MoviesFailure) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is MoviesSuccess) {
            return MoviesGridView(movies: state.movies);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
