import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/validation_utils.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/presentation/controller/register/auth_cubit.dart';
import 'package:clinic/features/authentication/presentation/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
                keyboardType: TextInputType.name,
                label: "username",
                prefixIcon: Icons.person_outline,
                validator: (String? value) {
                  return ValidationUtils.getNameValidationMessage(value);
                },
              ),
              VerticalSpacing(10),
              CustomTextFormField(
                controller: phoneController,
                label: "phone number",
                prefixIcon: Icons.phone_outlined,
                prefixText: "+20 ",
                maxLength: 11,
                keyboardType: TextInputType.phone,
                validator: (String? value) {
                  return ValidationUtils.getValidPhoneNumberValidationMessage(
                    value,
                  );
                },
              ),
              VerticalSpacing(10),
              CustomTextFormField(
                controller: emailController,
                label: "email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
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
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showApiError(context, state.errorModel);
            }
            if (state is AuthSuccess) {
              context.showSnackBar(
                state.data.message ?? "Registered successfully",
                backgroundColor: Colors.green,
              );
              context.pushNamed(
                Routes.verifyRegisterOtp,
                arguments: emailController.text.trim(),
              );
            }
          },
          builder: (context, state) {
            return CustomButton(
              lable:
                  state is AuthLoading
                      ? Center(child: CircularProgressIndicator())
                      : Text("Sign Up", style: AppStyles.font14W700White),
              onPressed:
                  state is AuthLoading
                      ? null
                      : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                            RegisterReqsuestBodyModel(
                              userName: nameController.text.trim(),
                              email: emailController.text.trim(),
                              phoneNumber: phoneController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        }
                      },
            );
          },
        ),
      ],
    );
  }
}
