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
import 'package:clinic/features/authentication/data/models/verify_register_otp_request_body_model.dart';
import 'package:clinic/features/authentication/presentation/controller/register/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyRegisterOtpScreen extends StatefulWidget {
  const VerifyRegisterOtpScreen({super.key, required this.registerData});
  final RegisterReqsuestBodyModel registerData;

  @override
  State<VerifyRegisterOtpScreen> createState() =>
      _VerifyRegisterOtpScreenState();
}

class _VerifyRegisterOtpScreenState extends State<VerifyRegisterOtpScreen> {
  final OtpFieldController _controller = OtpFieldController();
  String _otp = '';

  Timer? _timer;
  int _remainingSeconds = 300; // 5 minutes = 300 seconds

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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Verification", style: AppStyles.font24W700Black),
            VerticalSpacing(10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Go Check Your Email: ',
                    style: AppStyles.font16W400Grey,
                  ),
                  TextSpan(
                    text: widget.registerData.email,
                    style: AppStyles.font14W600Black,
                  ),
                  TextSpan(
                    text: ', we sent you an verify code',
                    style: AppStyles.font16W400Grey,
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
                backgroundColor: AppColors.softGrey,
                focusBorderColor: AppColors.primary,
                errorBorderColor: AppColors.red,
                borderColor: AppColors.grey,
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
                      style: AppStyles.font16W400Black,
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap:
                            _remainingSeconds == 0
                                ? () {
                                  _resendOtp(context);
                                }
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
                if (state is AuthVerifyOtpSuccess) {
                  context.showSnackBar(
                    state.data.message ?? "No Message",
                    backgroundColor: AppColors.green,
                  );
                  _cacheData(state);
                  context.pushNamed(Routes.patientInfo);
                }
              },
              builder: (context, state) {
                return CustomButton(
                  lable:
                      state is AuthLoading
                          ? const Center(child: CircularProgressIndicator())
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
                            context.read<AuthCubit>().verifyRegisterOtp(
                              VerifyRegisterOtpRequestBodyModel(
                                email: widget.registerData.email,
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

    context.read<AuthCubit>().register(widget.registerData);
  }

  Future<void> _cacheData(AuthVerifyOtpSuccess state) async {
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
