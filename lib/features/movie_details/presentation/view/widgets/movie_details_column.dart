import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

class MovieDetailsColumn extends StatelessWidget {
  const MovieDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: AppTextStyles.title,
        ),
        Text(
          'SubTitle',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: AppTextStyles.subtitle,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('8.5', style: AppTextStyles.subtitle),

            const SizedBox(width: 4),
            const Icon(Icons.star, color: Colors.amber),
          ],
        ),
        const SizedBox(height: 22),
      ],
    );
  }
}
