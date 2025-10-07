import 'package:json_annotation/json_annotation.dart';

import 'date_time_converter.dart';

part 'patient_request_body_model.g.dart';

@JsonSerializable()
class PatientRequestBodyModel {
  final String firstName;
  final String lastName;
  final String gender;

  @DateTimeConverter()
  final DateTime dateOfBirth;

  final String? address;
  final String? province;
  final String? city;

  PatientRequestBodyModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateOfBirth,
    this.address,
    this.province,
    this.city,
  });

  factory PatientRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$PatientRequestBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientRequestBodyModelToJson(this);
}
