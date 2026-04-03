import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_card.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_column.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MovieDetailsCard(movie: movie),
            SizedBox(width: 16),
            MovieDetailsColumn(movie: movie),
          ],
        ),
        SizedBox(height: 22),
        Text(movie.overview, style: AppTextStyles.subtitle),
      ],
    );
  }
}
