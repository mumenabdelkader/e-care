import 'package:clinic/core/networking/api_constant.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST(ApiConstant.registerEp)
  Future<RegisterResponseBodyModel> register({
    @Body() required RegisterReqsuestBodyModel body,
  });

  // Future<void> signIn(String email, String password);
  // Future<void> signOut();
}
