import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://dummyimage.com/300x450/000/fff&text=No",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.transparent,
              ),
              child: Text(
                'title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.title.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
