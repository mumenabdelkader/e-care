import 'package:clinic/core/styles/app_styles.dart'; // لتضمين الـ fontFamily
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // دالة مساعدة لإنشاء TextTheme (تم تعديلها لتأخذ اللون الأساسي)
  static TextTheme _buildTextTheme(
    Color baseTextColor,
    Color secondaryTextColor,
  ) {
    return TextTheme(
      // العناوين الرئيسية (Used for displayLarge, displayMedium, displaySmall)
      displayLarge: AppStyles.fontStyle(32.sp, FontWeight.w700, baseTextColor),
      displayMedium: AppStyles.fontStyle(22.sp, FontWeight.w700, baseTextColor),
      displaySmall: AppStyles.fontStyle(20.sp, FontWeight.w700, baseTextColor),

      // العناوين الفرعية (Used for titleLarge, titleMedium, titleSmall)
      titleLarge: AppStyles.fontStyle(16.sp, FontWeight.w700, baseTextColor),
      titleMedium: AppStyles.fontStyle(14.sp, FontWeight.w700, baseTextColor),
      titleSmall: AppStyles.fontStyle(
        12.sp,
        FontWeight.w400,
        secondaryTextColor,
      ), // لون ثانوي (رمادي)
      // النصوص الأساسية (Used for bodyLarge, bodyMedium)
      bodyLarge: AppStyles.fontStyle(16.sp, FontWeight.w400, baseTextColor),
      bodyMedium: AppStyles.fontStyle(14.sp, FontWeight.w400, baseTextColor),

      // الأنماط الأخرى
      labelMedium: AppStyles.fontStyle(14.sp, FontWeight.w600, baseTextColor),
    );
  }

  // --- Light Theme ---
  static ThemeData lightTheme = ThemeData(
    // الألوان الرئيسية
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,

    // 💡 تخصيص ColorScheme للوضع الفاتح
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.white, // لون النص على الخلفية
      surface: AppColors.softGrey, // لون الأسطح الخفيفة (مثل حقول الإدخال)
      onSurface: AppColors.black, // لون النص على الأسطح الخفيفة
    ),

    // 💡 تحديد لون الـ Hint/الرمادي الثانوي
    hintColor: AppColors.grey,
    // 💡 تحديد لون الفواصل/الحدود
    dividerColor: AppColors.softGrey,

    // تخصيص AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: const IconThemeData(color: AppColors.white),
      titleTextStyle: AppStyles.fontStyle(20, FontWeight.bold, AppColors.white),
    ),

    // 💡 تخصيص TextTheme بالكامل
    textTheme: _buildTextTheme(AppColors.black, AppColors.grey),

    // تخصيص الأيقونات (افتراضي للون الأسود/الرئيسي)
    iconTheme: const IconThemeData(color: AppColors.black),

    // تخصيص الأزرار
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // --- Dark Theme ---
  static ThemeData darkTheme = ThemeData(
    // الألوان الرئيسية
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkGrey,

    // 💡 تخصيص ColorScheme للوضع الداكن
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.white, // لون النص على الخلفية
      surface: AppColors.black, // لون الأسطح الخفيفة (أغمق قليلاً من الخلفية)
      onSurface: AppColors.white, // لون النص على الأسطح الخفيفة
    ),

    // 💡 تحديد لون الـ Hint/الرمادي الثانوي
    hintColor: AppColors.grey,
    // 💡 تحديد لون الفواصل/الحدود
    dividerColor: AppColors.darkGrey,

    // تخصيص AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: const IconThemeData(color: AppColors.white),
      titleTextStyle: AppStyles.fontStyle(20, FontWeight.bold, AppColors.white),
    ),

    // 💡 تخصيص TextTheme بالكامل
    textTheme: _buildTextTheme(AppColors.white, AppColors.grey),

    // تخصيص الأيقونات (افتراضي للون الأبيض)
    iconTheme: const IconThemeData(color: AppColors.white),

    // تخصيص الأزرار
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
