import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/authentication/data/models/forgot-password_body_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extension/spacing.dart';
import '../../../core/styles/app_styles.dart';
import '../../../core/utils/validation_utils.dart';
import '../../../core/widgets/app_dialog.dart';
import 'controller/register/auth_cubit.dart';

class ResetPasswordScreen extends StatelessWidget{
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reset Password",style: AppStyles.font24W700Black,),
            VerticalSpacing(8),
            Text("Enter your email, we will send a verification code to email",style: AppStyles.font16W400Grey,),
            VerticalSpacing(26),
            Form(
              key: _formKey,
              child: CustomTextFormField(
                controller: emailController,
                label: "Type your email",
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
                  showApiError(context, state.errorModel);
                }
                if (state is AuthSuccess) {
                  // context.showSnackBar(
                  //   state.data.message ?? "reset successfully",
                  //   backgroundColor: Colors.green,
                  // );
                  context.pushNamed(Routes.verifyPasswordRestOtp,arguments:
                   emailController.text
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  lable:
                  state is AuthLoading
                      ? Center(child: CircularProgressIndicator())
                      : Text("Send Link", style: AppStyles.font14W700White),
                  onPressed:
                  state is AuthLoading
                      ? null
                      : () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().forgotPassword(
                         " \"" +emailController.text+"\" "
                      );

                    }

                  },
                );
              },
            ),
            VerticalSpacing(36)

          ],
        ),
      ),

    );
  }
}