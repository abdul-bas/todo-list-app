import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.baground,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.baground,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.baground,
      foregroundColor: AppColors.onSurface,
      centerTitle: true,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.fontColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.onSurface,
        iconSize: 24,
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onSurface,
        minimumSize: const Size(double.infinity, 50),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      foregroundColor: AppColors.onSurface,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: const TextStyle(color: AppColors.hint),
      labelStyle: TextStyle(color: AppColors.onSurface),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.hint),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
