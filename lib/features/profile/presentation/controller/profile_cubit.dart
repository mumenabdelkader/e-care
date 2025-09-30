import 'package:clinic/core/networking/api_error_handler.dart';
import 'package:clinic/core/networking/api_error_model.dart';
import 'package:clinic/features/profile/data/models/patient_request_body_model.dart';
import 'package:clinic/features/profile/data/models/patient_response_body_model.dart';
import 'package:clinic/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> createPatientPprofile(PatientRequestBodyModel body) async {
    emit(ProfileLoading());
    try {
      final result = await profileRepo.createPatientPprofile(body);
      result.when(
        onSuccess: (data) => emit(ProfileCreatePatientProfileSuccess(data)),
        onError: (error) => emit(ProfileFailure(errorModel: error)),
      );
    } catch (e) {
      emit(ProfileFailure(errorModel: ApiErrorHandler.handle(e)));
    }
  }
}
