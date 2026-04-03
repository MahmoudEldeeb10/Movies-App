import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/custom_text_button.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

class MoviesDetailsView extends StatelessWidget {
  final MovieModel movie; // ← زود دي

  const MoviesDetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details', style: AppTextStyles.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetails(movie: movie),
            Spacer(),
            customTextButton(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
