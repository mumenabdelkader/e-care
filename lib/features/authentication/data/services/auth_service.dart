import 'package:clinic/core/networking/api_constant.dart';
import 'package:clinic/features/authentication/data/models/forgot_password_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/patient_request_body_model.dart';
import 'package:clinic/features/authentication/data/models/patient_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_request_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_response_model.dart';
import 'package:clinic/features/authentication/data/models/verify_forgot_otp_request_model.dart';
import 'package:clinic/features/authentication/data/models/verify_forgot_otp_respons_model.dart';
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

  @POST(ApiConstant.verifyRegisterOtpEP)
  Future<VerifyRegisterOtpReposneBodyModel> verifyRegisterOtp({
    @Body() required VerifyRegisterOtpRequestBodyModel body,
  });

  @POST(ApiConstant.verifyPasswordRestOtpEP)
  Future<VerifyForgotOTpRespons> verifyPasswordRestOtp({
    @Body() required VerifyForgotOTpRequestModel body,
  });
  @POST(ApiConstant.restPasswordEP)
  Future<ResetPasswordResponseModel> restPassword({
    @Body() required ResetPasswordRequestModel body,
  });

  @POST(ApiConstant.createPatientPprofileEP)
  Future<PatientResponseBodyModel> createPatientProfile({
    @Header("Authorization") required String token,
    @Body() required PatientRequestBodyModel body,
  });
}
