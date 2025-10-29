import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:clinic/features/booking/data/models/book_apointment_request_model.dart';
import 'package:clinic/features/booking/data/services/booking_service.dart';

import '../models/get_specialties_respose_model.dart';

abstract class BookingRepo {
  Future<ApiResult> getAvailableDoctors(
      {required bool GeneralDoctorTypes,
      required int SpecialtyId,
      required String AppointmentTime,
      required bool InPerson,
      required bool VideoCall});

  Future<ApiResult> getSpecialties();
  Future<ApiResult> availableSlots({required String doctorId,required String date});
  Future<ApiResult> bookAppointment({required BookApointmentRequestModel bookAppointRequestModel});
}

class BookingRepoImpl implements BookingRepo {
  final BookingService bookingService;
  BookingRepoImpl( this.bookingService);

  @override
  Future<ApiResult> getAvailableDoctors({required bool GeneralDoctorTypes, required int SpecialtyId, required String AppointmentTime, required bool InPerson, required bool VideoCall}) async {
    try {
      final token = await CacheHelper.getSecureData(key: CacheConstants.accessToken);
      final response = await bookingService.getAvailableDoctors(appointmentTime: AppointmentTime, generalDoctorTypes: GeneralDoctorTypes, inPerson: InPerson, specialtyId: SpecialtyId, videoCall: VideoCall ,token: "Bearer $token");
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult> getSpecialties()async {
    try {
      final token = await CacheHelper.getSecureData(key: CacheConstants.accessToken);
      final response =await bookingService.getSpecialties(token: "Bearer $token");
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
  @override
  Future<ApiResult> availableSlots({required String doctorId,required String date})async {
    try {
      final token = await CacheHelper.getSecureData(key: CacheConstants.accessToken);
      final response =await bookingService.availableSlots(doctorId :doctorId,token: "Bearer $token",date:date );
      // print(response);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
  @override
  Future<ApiResult> bookAppointment({
    required BookApointmentRequestModel bookAppointRequestModel,
  }) async {
    try {
      final token = await CacheHelper.getSecureData(key: CacheConstants.accessToken);
      final response = await bookingService.bookAppointmet(
        token: "Bearer $token",
        body: bookAppointRequestModel, // ✅ صح هنا
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }


}
