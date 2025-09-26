import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:clinic/features/authentication/data/models/forgot_password_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/patient_request_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_request_model.dart';
import 'package:clinic/features/authentication/data/models/verify_forgot_otp_request_model.dart';
import 'package:clinic/features/authentication/data/models/verify_register_otp_request_body_model.dart';
import 'package:clinic/features/authentication/data/services/auth_service.dart';

abstract class AuthRepo {
  Future<ApiResult> register(RegisterReqsuestBodyModel body);

  Future<ApiResult> login(LoginReqsuestBodyModel body);
  Future<ApiResult> forgotPassword(String email);

  Future<ApiResult> verifyRegisterOtp(VerifyRegisterOtpRequestBodyModel body);
  Future<ApiResult> verifyPasswordRestOtp(VerifyForgotOTpRequestModel body);
  Future<ApiResult> restPassword(ResetPasswordRequestModel body);
  Future<ApiResult> createPatientPprofile(PatientRequestBodyModel body);
}

class AuthRepoImpl implements AuthRepo {
  final AuthService authService;
  AuthRepoImpl({required this.authService});
  @override
  Future<ApiResult<RegisterResponseBodyModel>> register(
    RegisterReqsuestBodyModel body,
  ) async {
    try {
      final response = await authService.register(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<LoginResponseBodyModel>> login(
    LoginReqsuestBodyModel body,
  ) async {
    try {
      final response = await authService.login(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult> verifyRegisterOtp(
    VerifyRegisterOtpRequestBodyModel body,
  ) async {
    try {
      final response = await authService.verifyRegisterOtp(body: body);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<ForgotPasswordResponseBodyModel>> forgotPassword(
    String email,
  ) async {
    try {
      final response = await authService.forgotPassword(email: email);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult> verifyPasswordRestOtp(
    VerifyForgotOTpRequestModel body,
  ) async {
    try {
      final response = await authService.verifyPasswordRestOtp(body: body);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult> restPassword(ResetPasswordRequestModel body) async {
    try {
      final response = await authService.restPassword(body: body);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult> createPatientPprofile(PatientRequestBodyModel body) async {
    try {
      final token = await CacheHelper.getSecureData(
        key: CacheConstants.accessToken,
      );

      final response = await authService.createPatientProfile(
        token: "Bearer $token",
        body: body,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
