import 'package:app_boilerplate/shared/data/local/storage_service.dart';
import 'package:app_boilerplate/shared/providers/shared_prefs_service_provider.dart';
import 'package:app_boilerplate/shared/theme/app_colors.dart';
import 'package:app_boilerplate/shared/theme/text_styles.dart';
import 'package:app_boilerplate/shared/theme/text_theme.dart';
import 'package:app_boilerplate/shared/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
  (ref) {
    final storage = ref.watch(storageServiceProvider);
    return AppThemeModeNotifier(storage);
  },
);

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  AppThemeModeNotifier(this.storageService) : super(ThemeMode.light) {
    getCurrentTheme();
  }
  final StorageService storageService;

  ThemeMode currentTheme = ThemeMode.light;

  Future<void> getCurrentTheme() async {
    final theme = await storageService.get('APP_THEME_STORAGE_KEY');
    final value = ThemeMode.values.byName('${theme ?? 'light'}');
    state = value;
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setStatusBar(
      brightness: state == ThemeMode.light ? Brightness.dark : Brightness.light,
    );
    storageService.set('APP_THEME_STORAGE_KEY', state.name);
  }
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.lightGrey,
        error: AppColors.error,
        background: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.black,
        titleTextStyle: AppTextStyles.h2,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.lightGrey,
        error: AppColors.error,
      ),
      scaffoldBackgroundColor: AppColors.extraLightGrey,
      textTheme: TextThemes.textTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTextStyles.h2,
      ),
    );
  }
}
