import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extension/spacing.dart';
import '../../../core/styles/app_styles.dart';
import '../../../core/utils/validation_utils.dart';
import 'controller/auth_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reset Password", style: textTheme.displayLarge),
            VerticalSpacing(8),
            Text(
              "Enter your email, we will send a verification code to email",
              style: textTheme.bodyLarge,
            ),
            VerticalSpacing(26),
            Form(
              key: _formKey,
              child: CustomTextFormField(
                controller: emailController,
                label: Text("Type your email", style: textTheme.titleSmall),
                prefixIcon: Icons.email_outlined,
                validator: (String? value) {
                  return ValidationUtils.getEmailValidationMessage(value);
                },
              ),
            ),
            Spacer(),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showErrorDialog(context, state.errorModel);
                }
                if (state is AuthForgotPasswordSuccess) {
                  context.showSnackBar(
                    state.data.message ?? "Code Send successfully",
                    backgroundColor: Colors.green,
                  );
                  context.pushNamed(
                    Routes.verifyPasswordRestOtp,
                    arguments: {
                      'isNewRegister': false,
                      'registerData': null,
                      'forgotPasswordData': emailController.text.trim(),
                    },
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  lable:
                      state is AuthLoading
                          ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                          : Text("Send Code", style: AppStyles.font14W700White),
                  onPressed:
                      state is AuthLoading
                          ? null
                          : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().forgotPassword(
                                "\"${emailController.text.trim()}\"",
                              );
                            }
                          },
                );
              },
            ),
            VerticalSpacing(36),
          ],
        ),
      ),
    );
  }
}
