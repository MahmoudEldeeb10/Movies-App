import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/custom_text_button.dart';
import 'package:movies_app/features/movie_details/presentation/view/widgets/movie_details.dart';

class MoviesDetailsView extends StatelessWidget {
  const MoviesDetailsView({super.key});

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
          children: [MovieDetails(), Spacer(), customTextButton(), Spacer()],
        ),
      ),
    );
  }
}

