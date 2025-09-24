part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {
  final RegisterResponseBodyModel data;
  AuthRegisterSuccess(this.data);
}

class AuthVerifyOtpSuccess extends AuthState {
  final VerifyRegisterOtpReposneBodyModel data;
  AuthVerifyOtpSuccess(this.data);
}

class AuthCreatePatientProfileSuccess extends AuthState {
  final PatientResponseBodyModel data;
  AuthCreatePatientProfileSuccess(this.data);
}

final class AuthFailure extends AuthState {
  final ApiErrorModel errorModel;
  AuthFailure({required this.errorModel});
}
