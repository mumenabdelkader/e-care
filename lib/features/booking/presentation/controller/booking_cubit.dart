import 'package:bloc/bloc.dart';
import 'package:clinic/core/utils/di.dart';
import 'package:clinic/features/booking/data/models/available_solts_respons_model.dart';
import 'package:clinic/features/booking/data/models/book_apointment_request_model.dart';
import 'package:clinic/features/booking/data/models/book_apointment_respons_model.dart';
import 'package:clinic/features/booking/data/models/get-available-doctors_respons_model.dart';
import 'package:clinic/features/booking/data/models/get_specialties_respose_model.dart';
import 'package:clinic/features/booking/data/repos/booking_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/services/booking_service.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit( this.bookingRepo) : super(BookingLoading());
  BookingRepo bookingRepo;
  Future<void> getSpecialties()async {

    try{
     final result= await bookingRepo.getSpecialties();
     print(result);
     result.when(onSuccess:
         (data) => emit(BookingGetSpecialtiesSuccess(data)),
         onError: (error) => emit(BookingFailure(error.toString())));

    } catch (e) {
      emit(BookingFailure(e.toString()));
    }

  }
  Future<void> getAvailableDoctors({required bool GeneralDoctorTypes, required int SpecialtyId, required String AppointmentTime, required bool InPerson, required bool VideoCall})async {
    try{
     final result= await bookingRepo.getAvailableDoctors(GeneralDoctorTypes: GeneralDoctorTypes, SpecialtyId: SpecialtyId, AppointmentTime: AppointmentTime, InPerson: InPerson, VideoCall: VideoCall);
     result.when(onSuccess:
         (data) => emit(BookingGetAvailableDoctorsSuccess(data)),

         onError: (error) => emit(BookingFailure(error.toString())));

    } catch (e) {
      emit(BookingFailure(e.toString()));
    }

  }
  Future<void> availableSlots({required String doctorId,required String date})async {
    try{
      final result= await bookingRepo.availableSlots(date: date,doctorId: doctorId);
      print(result);
      result.when(onSuccess:
          (data) => emit(BookingAvailableSlotsSuccess(data)),

          onError: (error) => emit(BookingFailure(error.toString())));

    } catch (e) {
      emit(BookingFailure(e.toString()));
    }

  }
  Future<void> bookAppointment({required BookApointmentRequestModel bookAppointmentRequestModel})async {
    try{
      final result= await bookingRepo.bookAppointment( bookAppointRequestModel:  bookAppointmentRequestModel);
      print(result);
      result.when(onSuccess:
          (data) => emit(BookAppointementSuccess(data)),

          onError: (error) => emit(BookingFailure(error.toString())));

    } catch (e) {
      emit(BookingFailure(e.toString()));
    }

  }
}
