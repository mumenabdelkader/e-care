import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:clinic/features/authentication/data/models/patient_request_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/verify_register_otp_request_body_model.dart';
import 'package:clinic/features/authentication/data/services/auth_service.dart';

abstract class AuthRepo {
  Future<ApiResult> register(RegisterReqsuestBodyModel body);
  Future<ApiResult> verifyRegisterOtp(VerifyRegisterOtpRequestBodyModel body);
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
  Future<ApiResult> createPatientPprofile(PatientRequestBodyModel body) async {
    try {
      final token = await CacheHelper.getSecureData(
        key: CacheConstants.accessToken,
      );

      final response = await authService.createPatientPprofile(
        token: "Bearer $token",
        body: body,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
