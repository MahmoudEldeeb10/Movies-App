import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Colors.grey;
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.secondaryColor,
  );
}
