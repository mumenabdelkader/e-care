import 'package:json_annotation/json_annotation.dart';

part 'updata_patient_profile_request_body_model.g.dart';

@JsonSerializable()
class UpdataPatientProfileRequestBodyModel {
  final String firstName;
  final String lastName;
  final String gender;
  final String dateOfBirth;
  final String address;
  final String province;
  final String city;
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;

  UpdataPatientProfileRequestBodyModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
    required this.province,
    required this.city,
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  factory UpdataPatientProfileRequestBodyModel.fromJson(
    Map<String, dynamic> json,
  ) => _$UpdataPatientProfileRequestBodyModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UpdataPatientProfileRequestBodyModelToJson(this);
}
