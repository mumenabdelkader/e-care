import 'package:json_annotation/json_annotation.dart';

part 'patient_profile_model.g.dart';

@JsonSerializable()
class PatientProfileModel {
  final String patientId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String gender;
  final DateTime dateOfBirth;
  final String address;
  final String province;
  final String city;
  final String photoUrl;
  final bool success;
  final dynamic message;
  final dynamic errors;

  PatientProfileModel({
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
    required this.province,
    required this.city,
    required this.photoUrl,
    required this.success,
    required this.message,
    required this.errors,
  });
  factory PatientProfileModel.fromJson(Map<String, dynamic> json) =>
      _$PatientProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientProfileModelToJson(this);
}
