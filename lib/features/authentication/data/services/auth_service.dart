import 'package:clinic/core/networking/api_constant.dart';
import 'package:clinic/features/authentication/data/models/forgot-password_body_model.dart';
import 'package:clinic/features/authentication/data/models/forgot_password_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_respons_body_model.dart';
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
  @POST(ApiConstant.loginEp)
  Future<LoginResponseBodyModel> login({
    @Body() required LoginReqsuestBodyModel body,
  });
  @POST(ApiConstant.forgotPasswordEmailEP)
  Future<ForgotPasswordResponseBodyModel> forgotPassword({
    @Body() required String email,
  });

  // Future<void> signOut();
}
