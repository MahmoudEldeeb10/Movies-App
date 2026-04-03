import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/movie_card.dart';

class MoviesGridView extends StatelessWidget {
  final List<MovieModel> movies; // ← بس دي، امسح title و imageUrl

  const MoviesGridView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: movies.length, // ← مش 20 hard-coded
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 22,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]); // ← بتمرر الـ object
      },
    );
  }
}