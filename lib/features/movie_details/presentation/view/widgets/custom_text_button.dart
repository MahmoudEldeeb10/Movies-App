
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

class customTextButton extends StatelessWidget {
  const customTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Watch Now',
              style: AppTextStyles.title.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
