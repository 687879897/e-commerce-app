import 'package:e_commerce_friday_c9/ui/utils/app_color.dart';
import 'package:flutter/material.dart';


class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor ,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 18,
        color: AppColors.black.withOpacity(0.7),
        fontWeight: FontWeight.w300
      ),
      titleMedium: const TextStyle(
        fontSize: 24,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600
      ),
      titleLarge: const TextStyle(
          fontSize: 16,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w300
      ),
      bodySmall: const TextStyle(
          fontSize: 18,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500
      ),
      bodyLarge: const TextStyle(
          fontSize: 18,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w600
      )
    ),
  );
}