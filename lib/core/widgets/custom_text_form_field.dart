// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clinic/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? label;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final String? prefixText;
  final int? maxLength;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final bool? readOnly;
  final void Function()? onTap;

  const CustomTextFormField({
    super.key,
    this.label,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.obscureText,
    this.prefixText,
    this.maxLength,
    this.filled,
    this.fillColor,
    this.border,
    this.contentPadding,
    this.decoration,
    this.readOnly,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      validator: validator,
      maxLength: maxLength,
      readOnly: readOnly ?? false,
      onTap: onTap,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration:
          decoration ??
          InputDecoration(
            prefixIcon: Icon(prefixIcon, size: 25.sp, color: AppColors.grey),
            prefixText: prefixText,

            label: label,
            filled: filled,
            fillColor: fillColor,
            contentPadding: contentPadding,
            border:
                border ??
                UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.softGrey),
                ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2.w),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.softGrey),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 2.w),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 2.w),
            ),
            suffixIcon:
                suffixIcon != null
                    ? Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: suffixIcon,
                    )
                    : null,
          ),
    );
  }
}
