import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/movie_card.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 22,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return MovieCard();
      },
    );
  }
}
