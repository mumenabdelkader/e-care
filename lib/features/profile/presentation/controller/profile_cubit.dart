import 'dart:io';

import 'package:clinic/core/networking/api_error_handler.dart';
import 'package:clinic/core/networking/api_error_model.dart';
import 'package:clinic/features/profile/data/models/get_profile_response_body_model.dart';
import 'package:clinic/features/profile/data/models/patient_request_body_model.dart';
import 'package:clinic/features/profile/data/models/patient_response_body_model.dart';
import 'package:clinic/features/profile/data/models/photo_response_body_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_request_body_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_response_model.dart';
import 'package:clinic/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> createPatientPprofile(PatientRequestBodyModel body) async {
    emit(ProfileLoading());
    try {
      final result = await profileRepo.createPatientPprofile(body);
      result.when(
        onSuccess: (data) => emit(CreatedPatientProfileSuccess(data)),
        onError: (error) => emit(ProfileFailure(errorModel: error)),
      );
    } catch (e) {
      emit(ProfileFailure(errorModel: ApiErrorHandler.handle(e)));
    }
  }

  Future<void> updatePatientPprofile(
    UpdataPatientProfileRequestBodyModel body,
  ) async {
    emit(ProfileLoading());
    try {
      final result = await profileRepo.updatePatientPprofile(body);
      result.when(
        onSuccess: (data) => emit(ProfileUpdatedPatientSuccess(data)),
        onError: (error) => emit(ProfileFailure(errorModel: error)),
      );
    } catch (e) {
      emit(ProfileFailure(errorModel: ApiErrorHandler.handle(e)));
    }
  }

  Future<void> getPatientProfile() async {
    emit(ProfileLoading());
    try {
      final result = await profileRepo.getPatientProfile();
      result.when(
        onSuccess: (data) => emit(GetProfilePatientSuccess(data)),
        onError: (error) => emit(ProfileFailure(errorModel: error)),
      );
    } catch (e) {
      emit(ProfileFailure(errorModel: ApiErrorHandler.handle(e)));
    }
  }

  Future<void> uploadProfilePhoto(File file) async {
    emit(ProfileLoading());
    try {
      final result = await profileRepo.uploadProfilePhoto(file);
      result.when(
        onSuccess: (data) async {
          // الباك اند مش بيرجع photoUrl في الـ response
          // عشان كده بنعمل getPatientProfile عشان نجيب الصورة الجديدة
          await getPatientProfile();
        },
        onError: (error) {
          emit(ProfileFailure(errorModel: error));
        },
      );
    } catch (e) {
      emit(ProfileFailure(errorModel: ApiErrorHandler.handle(e)));
    }
  }

  Future<void> removeProfilePhoto() async {
    emit(ProfileLoading());
    try {
      final result = await profileRepo.removeProfilePhoto();
      result.when(
        onSuccess: (data) async {
          // الباك اند مش بيرجع photoUrl في الـ response
          // عشان كده بنعمل getPatientProfile عشان نجيب البيانات المحدثة
          await getPatientProfile();
        },
        onError: (error) {
          emit(ProfileFailure(errorModel: error));
        },
      );
    } catch (e) {
      emit(ProfileFailure(errorModel: ApiErrorHandler.handle(e)));
    }
  }

  Future<void> getProfilePhoto() async {
    emit(ProfileLoading());
    try {
      final result = await profileRepo.getProfilePhoto();
      result.when(
        onSuccess: (data) {
          emit(ProfilePhotoUpdated(data));
        },
        onError: (error) {
          emit(ProfileFailure(errorModel: error));
        },
      );
    } catch (e) {
      emit(ProfileFailure(errorModel: ApiErrorHandler.handle(e)));
    }
  }
}
