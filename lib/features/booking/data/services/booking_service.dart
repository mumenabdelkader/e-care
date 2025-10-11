import 'package:clinic/core/networking/api_constant.dart';
import 'package:clinic/features/authentication/data/models/forgot_password_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_request_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_response_model.dart';
import 'package:clinic/features/authentication/data/models/verify_forgot_otp_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/verify_otp_request_body_model.dart';
import 'package:clinic/features/authentication/data/models/verify_register_otp_reposne_body_model.dart';
import 'package:clinic/features/booking/data/models/get_specialties_respose_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/get-available-doctors_respons_model.dart';

part 'booking_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class BookingService {
   factory BookingService(Dio dio) = _BookingService;

  @GET(ApiConstant.getSpecialties)
  Future<GetSpecialtiesResposeModel> getSpecialties({
    @Header("Authorization") required String ?token,
  });
  @GET(ApiConstant.getAvailableDoctorsEP)
  Future<GetAvailableDoctorsResponseModel> getAvailableDoctors({
    @Header("Authorization") required String ?token,
    @Query("GeneralDoctorTypes") required bool GeneralDoctorTypes,
    @Query("SpecialtyId") required int SpecialtyId,
    @Query("AppointmentTime") required String AppointmentTime,
    @Query("InPerson") required bool InPerson,
    @Query("VideoCall") required bool VideoCall,
  });
}
