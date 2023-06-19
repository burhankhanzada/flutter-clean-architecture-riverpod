import 'package:flutter/material.dart';
import 'package:flutter_project/shared/theme/app_colors.dart';
import 'package:flutter_project/shared/theme/test_styles.dart';

class TextThemes {
  /// Main text theme

  static TextTheme get textTheme {
    return const TextTheme(
      bodyMedium: AppTextStyles.bodyLg,
      bodySmall: AppTextStyles.body,
      titleSmall: AppTextStyles.bodySm,
      bodyLarge: AppTextStyles.bodyXs,
      displayMedium: AppTextStyles.h1,
      displaySmall: AppTextStyles.h2,
      headlineMedium: AppTextStyles.h3,
      headlineSmall: AppTextStyles.h4,
    );
  }

  /// Dark text theme

  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyMedium: AppTextStyles.bodyLg.copyWith(color: AppColors.white),
      bodySmall: AppTextStyles.body.copyWith(color: AppColors.white),
      titleSmall: AppTextStyles.bodySm.copyWith(color: AppColors.white),
      bodyLarge: AppTextStyles.bodyXs.copyWith(color: AppColors.white),
      displayMedium: AppTextStyles.h1.copyWith(color: AppColors.white),
      displaySmall: AppTextStyles.h2.copyWith(color: AppColors.white),
      headlineMedium: AppTextStyles.h3.copyWith(color: AppColors.white),
      headlineSmall: AppTextStyles.h4.copyWith(color: AppColors.white),
    );
  }

  /// Primary text theme

  static TextTheme get primaryTextTheme {
    return TextTheme(
      bodyMedium: AppTextStyles.bodyLg.copyWith(color: AppColors.primary),
      bodySmall: AppTextStyles.body.copyWith(color: AppColors.primary),
      titleSmall: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
      bodyLarge: AppTextStyles.bodyXs.copyWith(color: AppColors.primary),
      displayMedium: AppTextStyles.h1.copyWith(color: AppColors.primary),
      displaySmall: AppTextStyles.h2.copyWith(color: AppColors.primary),
      headlineMedium: AppTextStyles.h3.copyWith(color: AppColors.primary),
      headlineSmall: AppTextStyles.h4.copyWith(color: AppColors.primary),
    );
  }
}
