import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/validation_utils.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/authentication/data/models/login_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/presentation/controller/register/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool policyCheckedValue = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: emailController,
                label: "email",
                prefixIcon: Icons.email_outlined,
                validator: (String? value) {
                  return ValidationUtils.getEmailValidationMessage(value);
                },
              ),
              VerticalSpacing(10),
              CustomTextFormField(
                controller: passwordController,
                obscureText: obscureText,
                label: "password",
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
                  return ValidationUtils.getBasicPasswordValidationMessage(
                    value,
                  );
                },
              ),
            ],
          ),
        ),
        VerticalSpacing(16),

        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showApiError(context, state.errorModel);
            }
            if (state is AuthSuccess) {
              context.showSnackBar(
                state.data.message ?? "Login successfully",
                backgroundColor: Colors.green,
              );
            }
          },
          builder: (context, state) {
            return CustomButton(
              lable:
                  state is AuthLoading
                      ? Center(child: CircularProgressIndicator())
                      : Text("login", style: AppStyles.font14W700White),
              onPressed:
                  state is AuthLoading
                      ? null
                      : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            LoginReqsuestBodyModel(
                              email: emailController.text,
                              password: passwordController.text,
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
