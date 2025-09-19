import 'package:clinic/core/networking/api_error_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body_model.dart';
import 'package:clinic/features/authentication/data/models/register_response_body_model.dart';
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
        emit(AuthSuccess(response: data));
      },
      onError: (error) {
        emit(AuthFailure(errorModel: error));
      },
    );
  }
}
