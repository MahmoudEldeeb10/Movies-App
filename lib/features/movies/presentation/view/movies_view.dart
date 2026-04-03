import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/movies/presentation/manager/cubit/movie_cubit.dart';
import 'package:movies_app/features/movies/presentation/manager/cubit/movie_state.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/movies_gridview.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().fetchMovies(); // ← هنا صح
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies', style: AppTextStyles.title)),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MoviesFailure) {
            return Center(child: Text(state.message));
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
