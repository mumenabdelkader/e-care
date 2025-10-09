import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:clinic/features/authentication/data/models/forgot_password_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/login_respons_body_model.dart';
import 'package:clinic/features/authentication/data/models/patient_request_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_request_model.dart';
import 'package:clinic/features/authentication/data/models/verify_otp_request_body_model.dart';
import 'package:clinic/features/authentication/data/services/auth_service.dart';
import 'package:clinic/features/booking/data/models/get-available-doctors_respons_model.dart';
import 'package:clinic/features/booking/data/models/get_specialties_respose_model.dart';
import 'package:clinic/features/booking/data/services/booking_service.dart';

abstract class BookingRepo {
  Future<ApiResult> getAvailableDoctors(
      {required bool GeneralDoctorTypes,
      required int SpecialtyId,
      required String AppointmentTime,
      required bool InPerson,
      required bool VideoCall});

  Future<ApiResult> getSpecialties();


}

class BookingRepoImpl implements BookingRepo {
  final BookingService bookingService;
  BookingRepoImpl({required this.bookingService});

  @override
  Future<ApiResult> getAvailableDoctors({required bool GeneralDoctorTypes, required int SpecialtyId, required String AppointmentTime, required bool InPerson, required bool VideoCall}) async {
    try {
      final response = await bookingService.getAvailableDoctors(AppointmentTime: AppointmentTime, GeneralDoctorTypes: GeneralDoctorTypes, InPerson: InPerson, SpecialtyId: SpecialtyId, VideoCall: VideoCall, token: await CacheHelper.getSecureData(key: CacheConstants.accessToken));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult> getSpecialties()async {
    try {
      final response = bookingService.getSpecialties(token:await CacheHelper.getSecureData(key: CacheConstants.accessToken));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

}
