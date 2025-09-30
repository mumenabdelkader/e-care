part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileCreatePatientProfileSuccess extends ProfileState {
  final PatientResponseBodyModel data;

  ProfileCreatePatientProfileSuccess(this.data);
}

final class ProfileFailure extends ProfileState {
  final ApiErrorModel errorModel;

  ProfileFailure({required this.errorModel});
}
