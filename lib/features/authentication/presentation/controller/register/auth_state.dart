part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

/// ✅ Success State عام لأي نوع Response
final class AuthSuccess<T> extends AuthState {
  final T data;
  AuthSuccess({required this.data});
}

/// ✅ Failure State عام لأي Error
final class AuthFailure extends AuthState {
  final ApiErrorModel errorModel;
  AuthFailure({required this.errorModel});
}
