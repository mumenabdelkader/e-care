import 'package:clinic/core/networking/api_constant.dart';
import 'package:clinic/features/authentication/data/models/forgot_password_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_request_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_respond_model.dart';
import 'package:clinic/features/authentication/data/models/verify_forgot_otp_request.dart';
import 'package:clinic/features/authentication/data/models/verify_forgot_otp_respons.dart';
import 'package:clinic/features/authentication/data/models/verify_register_otp_reposne_body_model.dart';
import 'package:clinic/features/authentication/data/models/verify_register_otp_request_body_model.dart';
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
  @POST(ApiConstant.verifyRegisterOtpEP)
  Future<VerifyRegisterOtpReposneBodyModel> verifyRegisterOtp({
    @Body() required VerifyRegisterOtpRequestBodyModel body,
  });
  // Future<void> signOut();
  @POST(ApiConstant.verifyPasswordRestOtpEP)
  Future<VerifyForgotOTpRespons> verifyPasswordRestOtp({
    @Body() required VerifyForgotOTpRequestModel body,
  });
  @POST(ApiConstant.restPasswordEP)
  Future<ResetPasswordRespondModel> restPassword({
    @Body() required ResetPasswordRequestModel body,
  });
}
