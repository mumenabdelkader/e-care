import 'package:json_annotation/json_annotation.dart';

part 'patient_response_body_model.g.dart';

@JsonSerializable()
class PatientResponseBodyModel {
  final bool success;
  final String message;
  final List? errors;

  PatientResponseBodyModel({
    required this.success,
    required this.message,
    required this.errors,
  });
  factory PatientResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$PatientResponseBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientResponseBodyModelToJson(this);
}
