import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request_body_model.g.dart';

@JsonSerializable()
class VerifyOtpRequestBodyModel {
  final String email;
  final String otpCode;

  const VerifyOtpRequestBodyModel({required this.email, required this.otpCode});

  factory VerifyOtpRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpRequestBodyModelToJson(this);
}
