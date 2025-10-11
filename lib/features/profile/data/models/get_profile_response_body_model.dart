import 'package:json_annotation/json_annotation.dart';

import 'patient_profile_model.dart';

part 'get_profile_response_body_model.g.dart';

@JsonSerializable()
class GetProfileResponseBodyModel {
  final bool success;
  final dynamic message;
  final dynamic errors;
  final PatientProfileModel profile;

  GetProfileResponseBodyModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.profile,
  });
  factory GetProfileResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetProfileResponseBodyModelToJson(this);
}
