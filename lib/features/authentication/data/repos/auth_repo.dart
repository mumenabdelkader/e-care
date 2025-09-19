import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/verify_register_otp_request_body_model.dart';
import 'package:clinic/features/authentication/data/services/auth_service.dart';

abstract class AuthRepo {
  Future<ApiResult> register(RegisterReqsuestBodyModel body);
  Future<ApiResult> verifyRegisterOtp(VerifyRegisterOtpRequestBodyModel body);
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
}
