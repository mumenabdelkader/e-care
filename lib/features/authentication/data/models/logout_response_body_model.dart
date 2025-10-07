import 'package:json_annotation/json_annotation.dart';

part 'logout_response_body_model.g.dart';

@JsonSerializable()
class LogoutResponseBodyModel {
  final bool success;
  final String? message;
  final List? errors;

  LogoutResponseBodyModel({
    required this.success,
    required this.message,
    required this.errors,
  });

  factory LogoutResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutResponseBodyModelToJson(this);
}
