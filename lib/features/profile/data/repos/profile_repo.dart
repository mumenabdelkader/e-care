import 'dart:convert';
import 'dart:io';

import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/networking/api_result.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:clinic/features/profile/data/models/get_profile_response_body_model.dart';
import 'package:clinic/features/profile/data/models/patient_request_body_model.dart';
import 'package:clinic/features/profile/data/models/patient_response_body_model.dart';
import 'package:clinic/features/profile/data/models/photo_response_body_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_request_body_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_response_model.dart';
import 'package:clinic/features/profile/data/services/profile_service.dart';

abstract class ProfileRepo {
  Future<ApiResult<PatientResponseBodyModel>> createPatientPprofile(
    PatientRequestBodyModel body,
  );
  Future<ApiResult> updatePatientPprofile(
    UpdataPatientProfileRequestBodyModel body,
  );
  Future<ApiResult<GetProfileResponseBodyModel>> getPatientProfile();
  Future<ApiResult<PhotoResponseBodyModel>> uploadProfilePhoto(File imageFile);
  Future<ApiResult<PhotoResponseBodyModel>> removeProfilePhoto();
  Future<ApiResult<PhotoResponseBodyModel>> getProfilePhoto();
}

class ProfileRepoImpl implements ProfileRepo {
  final ProfileService _profileService;

  ProfileRepoImpl(ProfileService profileService)
    : _profileService = profileService;

  @override
  Future<ApiResult<PatientResponseBodyModel>> createPatientPprofile(
    PatientRequestBodyModel body,
  ) async {
    try {
      final response = await _profileService.createPatientProfile(body: body);
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
  Future<ApiResult<GetProfileResponseBodyModel>> getPatientProfile() async {
    try {
      final response = await _profileService.getPatientProfile();

      await CacheHelper.set(
        key: CacheConstants.profileData,
        value: jsonEncode(response.profile.toJson()),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<PhotoResponseBodyModel>> uploadProfilePhoto(
    File imageFile,
  ) async {
    try {
      final response = await _profileService.setPatientPprofilePhoto(
        photo: imageFile,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<PhotoResponseBodyModel>> removeProfilePhoto() async {
    try {
      final response = await _profileService.reomvePatientPprofilePhoto();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<PhotoResponseBodyModel>> getProfilePhoto() async {
    try {
      final response = await _profileService.getPatientPprofilePhoto();
      await CacheHelper.set(
        key: CacheConstants.profilePhoto,
        value: response.photoUrl,
      );

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
