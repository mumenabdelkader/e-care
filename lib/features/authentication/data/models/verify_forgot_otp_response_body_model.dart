import 'package:json_annotation/json_annotation.dart';

part 'verify_forgot_otp_response_body_model.g.dart';

@JsonSerializable()
class VerifyForgotOtpResponseBodyModel {
  final bool? success;
  final String? message;
  final List<String>? errors;

  const VerifyForgotOtpResponseBodyModel({
    this.success,
    this.message,
    this.errors,
  });

  factory VerifyForgotOtpResponseBodyModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VerifyForgotOtpResponseBodyModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$VerifyForgotOtpResponseBodyModelToJson(this);
}
