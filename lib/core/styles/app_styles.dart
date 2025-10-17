// app_styles.dart
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static const String fontFamily = "Urbanist";

  // 💡 ملاحظة: الألوان التي تتغير مع الثيم (مثل الأسود والرمادي) يتم الآن جلبها عبر BuildContext.
  // تم استخدام:
  // - Theme.of(context).textTheme.bodyLarge?.color لـ "Black" (النص الأساسي)
  // - Theme.of(context).hintColor لـ "Grey" (النص الثانوي)

  static TextStyle fontStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle font24W700Black(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
    color: Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle font16W400Grey(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).hintColor,
  );

  // الألوان الثابتة (White) لا تحتاج لـ BuildContext
  static TextStyle font16W400White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font16W700Grey(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).hintColor,
  );

  static TextStyle font16W400Black(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyLarge?.color,
  );

  // الألوان الثابتة (White) لا تحتاج لـ BuildContext
  static TextStyle font14W700White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font14W700Black(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle font14W600Black(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle font22W700Black(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle font12W400Grey(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).hintColor,
  );

  // الألوان الثابتة (Primary, Red) لا تحتاج لـ BuildContext
  static TextStyle font14W700Primary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static TextStyle font16W700Primary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static TextStyle font14W600Primary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static TextStyle font14W400Black(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyLarge?.color,
  );

  // الألوان الثابتة (White) لا تحتاج لـ BuildContext
  static TextStyle font32W700White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle font20W700White = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  // الألوان الثابتة (Red) لا تحتاج لـ BuildContext
  static TextStyle font24W700Red = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.red,
  );
}
