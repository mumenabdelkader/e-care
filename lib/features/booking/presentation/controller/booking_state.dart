part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingLoading extends BookingState {}

final class BookingGetSpecialtiesSuccess extends BookingState {
final List<GetSpecialtiesResposeModel> specialties;
BookingGetSpecialtiesSuccess(this.specialties);
}

final class BookingGetAvailableDoctorsSuccess extends BookingState {
  final List<GetAvailableDoctorsResponseModel> AvailableDoctors;
  BookingGetAvailableDoctorsSuccess(this.AvailableDoctors);
}

final class BookingFailure extends BookingState {
  final String error;
  BookingFailure(this.error);
}
