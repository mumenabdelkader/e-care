import 'package:clinic/core/networking/api_error_model.dart';
import 'package:clinic/features/authentication/data/models/register_reqsuest_body.dart';
import 'package:clinic/features/authentication/data/models/register_response_body.dart';
import 'package:clinic/features/authentication/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> register(RegisterReqsuestBody body) async {
    emit(RegisterLoading());

    final result = await authRepo.register(body);
    result.when(
      onSuccess: (data) {
        emit(RegisterSuccess(response: data));
      },
      onError: (error) {
        emit(RegisterFailure(errorMessage: error));
      },
    );
  }
}
