import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.fontFamily,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.scaffoldBackGround,
      highlightColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.black,
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        shape: CircleBorder(),
      ));
}
