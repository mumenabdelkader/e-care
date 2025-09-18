import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/validation_utils.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/authentication/presentation/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool policyCheckedValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: nameController,
                label: "username",
                prefixIcon: Icons.person_outline,
                validator: (String? value) {
                  return ValidationUtils.getNameValidationMessage(value);
                },
              ),
              VerticalSpacing(10),
              CustomTextFormField(
                controller: emailController,
                label: "email",
                prefixIcon: Icons.email_outlined,
                validator: (String? value) {
                  return ValidationUtils.getEmailValidationMessage(value);
                },
              ),
              VerticalSpacing(10),
              PasswordTextField(passwordController: passwordController),
            ],
          ),
        ),
        VerticalSpacing(16),
        Row(
          children: [
            Checkbox(
              value: policyCheckedValue,
              onChanged: (value) {
                setState(() {
                  policyCheckedValue = value!;
                });
              },
              activeColor: AppColors.primary,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: "I agree to the ",
                  style: AppStyles.font14W600Black,
                  children: [
                    TextSpan(
                      text: "Terms of Service ",
                      style: AppStyles.font14W400Black,
                    ),
                    TextSpan(text: "and \n", style: AppStyles.font14W400Black),
                    TextSpan(
                      text: "Privacy Policy",
                      style: AppStyles.font14W400Black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        VerticalSpacing(42),
        CustomButton(
          lable: "sign Up",
          onPressed: () {
            if (_formKey.currentState!.validate()) {}
          },
        ),
      ],
    );
  }
}
