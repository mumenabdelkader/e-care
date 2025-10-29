
import 'package:json_annotation/json_annotation.dart';
part 'book_apointment_respons_model.g.dart';
@JsonSerializable()
class BookAppointmentResponsModel {
  int? appointmentId;
  String? message;
  String? status;

  BookAppointmentResponsModel({this.appointmentId, this.message, this.status});

  factory BookAppointmentResponsModel.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentResponsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentResponsModelToJson(this);
}
