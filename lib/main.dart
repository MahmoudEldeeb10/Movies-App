import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/view/movies_details_view.dart';
import 'package:movies_app/features/movies/presentation/view/movies_view.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const MoviesView(),
        '/details': (_) => const MoviesDetailsView(),
      },
    );
  }
}
