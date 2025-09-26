import 'package:clinic/core/networking/api_error_handler.dart';
import 'package:clinic/core/networking/api_error_model.dart';
import 'package:clinic/features/authentication/data/models/login_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/reset_password_request_model.dart';
import 'package:clinic/features/authentication/data/models/verify_forgot_otp_request_model.dart';
import 'package:clinic/features/authentication/data/models/patient_request_body_model.dart';
import 'package:clinic/features/authentication/data/models/patient_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
import 'package:clinic/features/authentication/data/models/verify_register_otp_reposne_body_model.dart';
import 'package:clinic/features/authentication/data/models/verify_register_otp_request_body_model.dart';
import 'package:clinic/features/authentication/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> register(RegisterReqsuestBodyModel body) async {
    emit(AuthLoading());

    final result = await authRepo.register(body);
    result.when(
      onSuccess: (data) {
        emit(AuthRegisterSuccess(data));
      },
      onError: (error) {
        emit(AuthFailure(errorModel: error));
      },
    );
  }

  Future<void> verifyRegisterOtp(VerifyRegisterOtpRequestBodyModel body) async {
    emit(AuthLoading());
    final result = await authRepo.verifyRegisterOtp(body);
    result.when(
      onSuccess: (data) {
        emit(AuthVerifyOtpSuccess(data));
      },
      onError: (error) {
        emit(AuthFailure(errorModel: error));
      },
    );
  }

  Future<void> verifyPasswordRestOtp(VerifyForgotOTpRequestModel body) async {
    emit(AuthLoading());
    final result = await authRepo.verifyPasswordRestOtp(body);
    result.when(
      onSuccess: (data) {
        emit(AuthSuccess(data: data));
      },
      onError: (error) {
        emit(AuthFailure(errorModel: error));
      },
    );
  }

  Future<void> login(LoginReqsuestBodyModel body) async {
    emit(AuthLoading());

    final result = await authRepo.login(body);
    result.when(
      onSuccess: (data) {
        emit(AuthSuccess(data: data));
      },
      onError: (error) {
        emit(AuthFailure(errorModel: error));
      },
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());

    final result = await authRepo.forgotPassword(email);
    result.when(
      onSuccess: (data) {
        emit(AuthSuccess(data: data));
      },
      onError: (error) {
        emit(AuthFailure(errorModel: error));
      },
    );
  }

  Future<void> restPassword(ResetPasswordRequestModel body) async {
    emit(AuthLoading());

    final result = await authRepo.restPassword(body);
    result.when(
      onSuccess: (data) {
        emit(AuthSuccess(data: data));
      },
      onError: (error) {
        emit(AuthFailure(errorModel: error));
      },
    );
  Future<void> createPatientPprofile(PatientRequestBodyModel body) async {
    emit(AuthLoading());
    try {
      final result = await authRepo.createPatientPprofile(body);
      result.when(
        onSuccess: (data) => emit(AuthCreatePatientProfileSuccess(data)),
        onError: (error) => emit(AuthFailure(errorModel: error)),
      );
    } catch (e) {
      emit(AuthFailure(errorModel: ApiErrorHandler.handle(e)));
    }
  }
}
