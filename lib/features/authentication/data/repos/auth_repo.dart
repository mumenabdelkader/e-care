import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body.dart';
import 'package:clinic/features/authentication/data/models/register_response_body.dart';
import 'package:clinic/features/authentication/data/services/auth_service.dart';

abstract class AuthRepo {
  Future<ApiResult> register(RegisterReqsuestBody body);
}

class AuthRepoImpl implements AuthRepo {
  final AuthService authService;
  AuthRepoImpl({required this.authService});
  @override
  Future<ApiResult<RegisterResponseBody>> register(
    RegisterReqsuestBody body,
  ) async {
    try {
      final response = await authService.register(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
