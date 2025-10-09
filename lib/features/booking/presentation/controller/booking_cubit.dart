import 'package:bloc/bloc.dart';
import 'package:clinic/features/booking/data/models/get-available-doctors_respons_model.dart';
import 'package:clinic/features/booking/data/models/get_specialties_respose_model.dart';
import 'package:clinic/features/booking/data/repos/booking_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/services/booking_service.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingLoading());

  Future<void> getSpecialties()async {
    BookingRepo bookingRepo = BookingRepoImpl(bookingService: BookingService(Dio()));
    try{
     final result= await bookingRepo.getSpecialties();
     result.when(onSuccess:
         (data) => emit(BookingGetSpecialtiesSuccess(data)),
         onError: (error) => emit(BookingFailure(error.toString())));

    } catch (e) {
      emit(BookingFailure(e.toString()));
    }

  }
  Future<void> getAvailableDoctors({required bool GeneralDoctorTypes, required int SpecialtyId, required String AppointmentTime, required bool InPerson, required bool VideoCall})async {
    BookingRepo bookingRepo = BookingRepoImpl(bookingService: BookingService(Dio()));
    try{
     final result= await bookingRepo.getAvailableDoctors(GeneralDoctorTypes: GeneralDoctorTypes, SpecialtyId: SpecialtyId, AppointmentTime: AppointmentTime, InPerson: InPerson, VideoCall: VideoCall);
     result.when(onSuccess:
         (data) => emit(BookingGetAvailableDoctorsSuccess(data)),
         onError: (error) => emit(BookingFailure(error.toString())));

    } catch (e) {
      emit(BookingFailure(e.toString()));
    }

  }
}
