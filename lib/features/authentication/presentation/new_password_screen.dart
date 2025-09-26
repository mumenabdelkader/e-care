import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/authentication/data/models/reset_password_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/validation_utils.dart';
import '../../../core/widgets/custom_button.dart';
import 'controller/register/auth_cubit.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;
  const NewPasswordScreen({super.key, required this.email});
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool policyCheckedValue = false;

  bool newObscureText = true;
  bool confirmObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Password", style: AppStyles.font24W700Black),
              VerticalSpacing(8),
              Text(
                "Create a new password that is safe and easy to remember",
                style: AppStyles.font16W400Grey,
              ),
              VerticalSpacing(26),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: newPasswordController,
                      obscureText: newObscureText,
                      label: Text(
                        "New password",
                        style: AppStyles.font12W400Grey,
                      ),
                      prefixIcon: Icons.lock_outline_sharp,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            newObscureText = !newObscureText;
                          });
                        },
                        icon: Icon(
                          newObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        return ValidationUtils.getBasicPasswordValidationMessage(
                          value,
                        );
                      },
                    ),
                    VerticalSpacing(20),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      obscureText: confirmObscureText,
                      label: Text(
                        "confirm password",
                        style: AppStyles.font12W400Grey,
                      ),
                      prefixIcon: Icons.lock_outline_sharp,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            confirmObscureText = !confirmObscureText;
                          });
                        },
                        icon: Icon(
                          confirmObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        return ValidationUtils.getBasicPasswordValidationMessage(
                          value,
                        );
                      },
                    ),
                  ],
                ),
              ),
              VerticalSpacing(50),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    showErrorDialog(context, state.errorModel);
                  }
                  if (state is AuthRestPasswordSuccess) {
                    context.showSnackBar(
                      state.data.message ?? "Login successfully",
                      backgroundColor: Colors.green,
                    );
                    context.pushAndRemoveUntil(
                      Routes.login,
                      predicate: (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    lable:
                        state is AuthLoading
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                              "Confirm New Password",
                              style: AppStyles.font14W700White,
                            ),
                    onPressed:
                        state is AuthLoading
                            ? null
                            : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().restPassword(
                                  ResetPasswordRequestModel(
                                    confirmPassword:
                                        confirmPasswordController.text,
                                    newPassword: newPasswordController.text,
                                    email: widget.email,
                                  ),
                                );
                              }
                            },
                  );
                },
              ),
              VerticalSpacing(40),
            ],
          ),
        ),
      ),
    );
  }
}
