import 'package:json_annotation/json_annotation.dart';

part 'updata_patient_profile_response_model.g.dart';

@JsonSerializable()
class UpdataPatientProfileResponseModel {
  final bool success;
  final String? message;
  final List? errors;

  UpdataPatientProfileResponseModel({
    required this.success,
    required this.message,
    required this.errors,
  });

  factory UpdataPatientProfileResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$UpdataPatientProfileResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UpdataPatientProfileResponseModelToJson(this);
}
