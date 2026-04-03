import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_card.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details_column.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MovieDetailsCard(),
            SizedBox(width: 16),
            MovieDetailsColumn(),
          ],
        ),

        SizedBox(height: 22),
        Text(
          'overview lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
