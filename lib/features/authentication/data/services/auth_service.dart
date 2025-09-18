import 'package:clinic/core/networking/api_constant.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body.dart';
import 'package:clinic/features/authentication/data/models/register_response_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST(ApiConstant.registerEp)
  Future<RegisterResponseBody> register({
    @Body() required RegisterReqsuestBody body,
  });

  // Future<void> signIn(String email, String password);
  // Future<void> signOut();
}
