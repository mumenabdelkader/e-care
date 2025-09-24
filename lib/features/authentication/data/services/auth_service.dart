import 'package:clinic/core/networking/api_constant.dart';
import 'package:clinic/features/authentication/data/models/patient_request_body_model.dart';
import 'package:clinic/features/authentication/data/models/patient_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
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

  @POST(ApiConstant.verifyRegisterOtpEP)
  Future<VerifyRegisterOtpReposneBodyModel> verifyRegisterOtp({
    @Body() required VerifyRegisterOtpRequestBodyModel body,
  });

  @POST(ApiConstant.createPatientPprofileEP)
  Future<PatientResponseBodyModel> createPatientPprofile({
    @Header("Authorization") required String token,
    @Body() required PatientRequestBodyModel body,
  });
}
