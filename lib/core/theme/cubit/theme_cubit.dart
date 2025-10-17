import 'dart:developer';

import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  bool get isDark => state == ThemeMode.dark;

  Future<void> _loadTheme() async {
    final isDarkMode =
        CacheHelper.getBool(key: CacheConstants.isDarkMode) ?? false;
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    log('Loaded theme from cache: ${isDarkMode ? "Dark" : "Light"}');
  }

  void toggleTheme(bool isDarkMode) {
    final newTheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    emit(newTheme);
    CacheHelper.set(key: CacheConstants.isDarkMode, value: isDarkMode);
    log('App theme changed to: ${isDarkMode ? "Dark" : "Light"}');
  }
}
