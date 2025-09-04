import 'package:day_36_darsda1/core/utils/colors.dart';
import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.brownF9,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.brownF9,
      surfaceTintColor: Colors.transparent,
      titleTextStyle:AppStyles.appBarT,
    ),
    colorScheme: ColorScheme.light(primary: AppColors.beige),
  );
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.beige,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.beige,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppStyles.appBarT,
    ),
    colorScheme: ColorScheme.dark(primary: AppColors.brownF9),
  );
}
