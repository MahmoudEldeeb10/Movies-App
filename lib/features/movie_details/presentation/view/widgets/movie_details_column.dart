import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

class MovieDetailsColumn extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsColumn({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.title.copyWith(fontSize: 20),
          ),
          Text(
            movie.language ?? 'en',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.subtitle,
          ),
          Row(
            children: [
              Text(
                movie.rating.toStringAsFixed(1),
                style: AppTextStyles.subtitle,
              ),
              const SizedBox(width: 4),
              const Icon(Icons.star, color: Colors.amber),
            ],
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}
