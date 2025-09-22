import 'package:json_annotation/json_annotation.dart';
part 'forgot_password_respons_body_model.g.dart';
@JsonSerializable()
class ForgotPasswordResponseBodyModel {
  final bool success;
  final String? message;
  final List? errors;

  ForgotPasswordResponseBodyModel({
    required this.success,
    required this.message,
    required this.errors,
  });
  factory ForgotPasswordResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseBodyModelToJson(this);
}