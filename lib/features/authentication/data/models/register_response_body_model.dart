import 'package:json_annotation/json_annotation.dart';

part 'register_response_body_model.g.dart';

@JsonSerializable()
class RegisterResponseBodyModel {
  final bool success;
  final String? message;
  final List errors;

  RegisterResponseBodyModel({
    required this.success,
    required this.message,
    required this.errors,
  });
  factory RegisterResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseBodyModelToJson(this);
}
