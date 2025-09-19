part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final RegisterResponseBodyModel response;
  AuthSuccess({required this.response});
}

final class AuthFailure extends AuthState {
  final ApiErrorModel errorModel;
  AuthFailure({required this.errorModel});
}
