part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final RegisterResponseBody response;
  RegisterSuccess({required this.response});
}

final class RegisterFailure extends RegisterState {
  final ApiErrorModel errorMessage;
  RegisterFailure({required this.errorMessage});
}
