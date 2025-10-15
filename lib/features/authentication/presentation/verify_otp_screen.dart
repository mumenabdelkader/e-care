import 'dart:async';

import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/verify_otp_request_body_model.dart';
import 'package:clinic/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({
    super.key,
    required this.isNewRegister,
    required this.registerData,
    required this.forgotPasswordData,
  });
  final bool isNewRegister;
  final RegisterReqsuestBodyModel? registerData;
  final String? forgotPasswordData;
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final OtpFieldController _controller = OtpFieldController();
  String _otp = '';

  Timer? _timer;
  int _remainingSeconds = 300;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final secondaryTextColor = Theme.of(context).hintColor;

    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Verification", style: textTheme.titleLarge),
            VerticalSpacing(10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Go Check Your Email: ',
                    style: textTheme.bodyLarge?.copyWith(
                      color: secondaryTextColor,
                    ),
                  ),
                  TextSpan(
                    text:
                        widget.registerData?.email ?? widget.forgotPasswordData,
                    style: textTheme.labelMedium,
                  ),
                  TextSpan(
                    text: ', we sent you an verify code',
                    style: textTheme.bodyLarge?.copyWith(
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacing(40.h),
            OTPTextField(
              length: 4,
              controller: _controller,
              width: MediaQuery.sizeOf(context).width,
              fieldWidth: 50.w,
              fieldStyle: FieldStyle.box,
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              outlineBorderRadius: 40.r,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: Theme.of(
                  context,
                ).primaryColor.withOpacity(0.1),
                focusBorderColor: AppColors.primary,
                errorBorderColor: AppColors.red,
                borderColor: Theme.of(context).dividerColor,
              ),
              keyboardType: TextInputType.number,
              onChanged: (pin) {
                setState(() => _otp = pin);
              },
              onCompleted: (pin) => setState(() => _otp = pin),
            ),
            VerticalSpacing(25),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resend code in ",
                      style: textTheme.bodyLarge,
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap:
                            _remainingSeconds == 0
                                ? () => _resendOtp(context)
                                : null,
                        child: Text(
                          _remainingSeconds == 0 ? "Resend" : _formattedTime,
                          style: AppStyles.font16W700Primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpacing(60),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure && _otp.length >= 4) {
                  showErrorDialog(context, state.errorModel);
                }
                if (state is AuthVerifyRegisterOtpSuccess) {
                  context.showSnackBar(
                    state.data.message ?? "No Message",
                    backgroundColor: AppColors.green,
                  );
                  _cacheData(state);
                  context.pushNamed(Routes.createPatientProfile);
                }
                if (state is AuthVerifyForgotPasswordOtpSuccess) {
                  context.showSnackBar(
                    state.data.message ?? "Verified Successfully",
                    backgroundColor: AppColors.green,
                  );
                  context.pushNamed(
                    Routes.newPassword,
                    arguments: widget.forgotPasswordData,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  lable:
                      state is AuthLoading
                          ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          )
                          : Text('Continue', style: AppStyles.font14W700White),
                  onPressed:
                      state is AuthLoading
                          ? null
                          : () {
                            if (_otp.length != 4) {
                              context.showSnackBar(
                                'Please enter all 4 digits',
                                backgroundColor: AppColors.grey,
                              );
                              return;
                            }
                            widget.isNewRegister && widget.registerData != null
                                ? context.read<AuthCubit>().verifyRegisterOtp(
                                  VerifyOtpRequestBodyModel(
                                    email: widget.registerData!.email,
                                    otpCode: _otp,
                                  ),
                                )
                                : context
                                    .read<AuthCubit>()
                                    .verifyPasswordRestOtp(
                                      VerifyOtpRequestBodyModel(
                                        email: widget.forgotPasswordData!,
                                        otpCode: _otp,
                                      ),
                                    );
                          },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _resendOtp(BuildContext context) {
    _startTimer();

    widget.isNewRegister
        ? context.read<AuthCubit>().verifyRegisterOtp(
          VerifyOtpRequestBodyModel(
            email: widget.registerData!.email,
            otpCode: _otp,
          ),
        )
        : context.read<AuthCubit>().verifyPasswordRestOtp(
          VerifyOtpRequestBodyModel(
            email: widget.forgotPasswordData!,
            otpCode: _otp,
          ),
        );
  }

  Future<void> _cacheData(AuthVerifyRegisterOtpSuccess state) async {
    if (state.data.token != null && state.data.refreshToken != null) {
      await CacheHelper.setSecureData(
        key: CacheConstants.accessToken,
        value: state.data.token!,
      );
      await CacheHelper.setSecureData(
        key: CacheConstants.refreshToken,
        value: state.data.refreshToken!,
      );
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _remainingSeconds = 300;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _timer?.cancel();
      }
    });
  }

  String get _formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
