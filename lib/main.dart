import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/presentation/view/movies_view.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MoviesView());
  }
}
