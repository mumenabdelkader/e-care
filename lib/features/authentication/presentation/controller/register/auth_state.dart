part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {
  final RegisterResponseBodyModel data;
  AuthRegisterSuccess(this.data);
}

class AuthLoginSuccess extends AuthState {
  final LoginResponseBodyModel data;
  AuthLoginSuccess(this.data);
}

class AuthVerifyPasswordRestOtpSuccess extends AuthState {
  final VerifyForgotOtpResponseBodyModel data;
  AuthVerifyPasswordRestOtpSuccess(this.data);
}

class AuthForgotPasswordSuccess extends AuthState {
  final ForgotPasswordResponseBodyModel data;
  AuthForgotPasswordSuccess(this.data);
}

class AuthRestPasswordSuccess extends AuthState {
  final ResetPasswordResponseModel data;
  AuthRestPasswordSuccess(this.data);
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
