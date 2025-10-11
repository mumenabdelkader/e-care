import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/core/utils/cache_helper.dart';
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
