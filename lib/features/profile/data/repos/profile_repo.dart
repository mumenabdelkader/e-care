import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/features/profile/data/models/patient_request_body_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_request_body_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_response_model.dart';
import 'package:clinic/features/profile/data/services/profile_service.dart';

abstract class ProfileRepo {
  Future<ApiResult> createPatientPprofile(PatientRequestBodyModel body);
  Future<ApiResult> updatePatientPprofile(
    UpdataPatientProfileRequestBodyModel body,
  );
  Future<ApiResult> getPatientProfile();
}

class ProfileRepoImpl implements ProfileRepo {
  final ProfileService _profileService;

  ProfileRepoImpl(ProfileService profileService)
    : _profileService = profileService;

  @override
  Future<ApiResult> createPatientPprofile(PatientRequestBodyModel body) async {
    try {
      // final token = await CacheHelper.getSecureData(
      //   key: CacheConstants.accessToken,
      // );

      final response = await _profileService.createPatientProfile(
        // token: "Bearer $token",
        body: body,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<UpdataPatientProfileResponseModel>> updatePatientPprofile(
    UpdataPatientProfileRequestBodyModel body,
  ) async {
    try {
      final response = await _profileService.updatePatientPprofile(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult> getPatientProfile() async {
    try {
      final response = await _profileService.getPatientProfile();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
