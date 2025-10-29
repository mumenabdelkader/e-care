import 'package:json_annotation/json_annotation.dart';

part 'book_apointment_request_model.g.dart';
@JsonSerializable()
class BookApointmentRequestModel {
  String? doctorId;
  String? date;
  String? startTime;
  String? visitType;
  String? reasonForVisit;

  BookApointmentRequestModel(
      {this.doctorId,
        this.date,
        this.startTime,
        this.visitType,
        this.reasonForVisit});

  factory BookApointmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookApointmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookApointmentRequestModelToJson(this);
}

