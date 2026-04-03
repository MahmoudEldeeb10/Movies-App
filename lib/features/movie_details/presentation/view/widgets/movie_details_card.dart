
import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/movie_card.dart';

class MovieDetailsCard extends StatelessWidget {
  const MovieDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.55,
      child: MovieCard(),
    );
  }
}
