import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/validation_utils.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.passwordController});
  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  bool hasUppercase = false;
  bool hasDigits = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(_validatePassword);
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(_validatePassword);
    super.dispose();
  }

  void _validatePassword() {
    final password = widget.passwordController.text;

    setState(() {
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasLowercase = password.contains(RegExp(r'[a-z]'));
      hasDigits = password.contains(RegExp(r'[0-9]'));
      hasSpecialCharacters = password.contains(
        RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
      );
      hasMinLength = password.length >= 8;
    });
  }

  Widget _buildFlag(String text, bool condition) {
    return Row(
      children: [
        Icon(
          condition ? Icons.check_circle : Icons.radio_button_unchecked,
          color: condition ? Colors.green : Colors.grey,
          size: 18.sp,
        ),
        const HorizontalSpacing(8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: condition ? Colors.green : Colors.grey,
            fontWeight: condition ? FontWeight.bold : FontWeight.normal,
            decoration:
                condition ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller: widget.passwordController,
          obscureText: obscureText,
          keyboardType: TextInputType.visiblePassword,
          label: Text("Password", style: AppStyles.font12W400Grey),
          prefixIcon: Icons.lock_outline_sharp,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.grey,
            ),
          ),

          validator: (String? value) {
            return ValidationUtils.getBasicPasswordValidationMessage(value);
          },
        ),
        const VerticalSpacing(10),
        _buildFlag("At least 1 uppercase letter", hasUppercase),
        _buildFlag("At least 1 lowercase letter", hasLowercase),
        _buildFlag("At least 1 number", hasDigits),
        _buildFlag("At least 1 special character", hasSpecialCharacters),
        _buildFlag("Minimum 8 characters", hasMinLength),
      ],
    );
  }
}
