import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/movies_gridview.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies', style: AppTextStyles.title)),
      body: MoviesGridView(),
    );
  }
}
