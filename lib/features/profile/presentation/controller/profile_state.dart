part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class CreatedPatientProfileSuccess extends ProfileState {
  final PatientResponseBodyModel data;

  CreatedPatientProfileSuccess(this.data);
}

final class ProfileUpdatedPatientSuccess extends ProfileState {
  final UpdataPatientProfileResponseModel data;

  ProfileUpdatedPatientSuccess(this.data);
}

final class GetProfilePatientSuccess extends ProfileState {
  final GetProfileResponseBodyModel data;

  GetProfilePatientSuccess(this.data);
}

final class ProfilePhotoUpdated extends ProfileState {
  final PhotoResponseBodyModel data;

  ProfilePhotoUpdated(this.data);
}

final class ProfileFailure extends ProfileState {
  final ApiErrorModel errorModel;

  ProfileFailure({required this.errorModel});
}