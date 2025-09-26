import 'package:json_annotation/json_annotation.dart';

part 'verify_register_otp_request_body_model.g.dart';

@JsonSerializable()
class VerifyRegisterOtpRequestBodyModel {
  final String email;
  final String otpCode;

  const VerifyRegisterOtpRequestBodyModel({
    required this.email,
    required this.otpCode,
  });

  factory VerifyRegisterOtpRequestBodyModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VerifyRegisterOtpRequestBodyModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$VerifyRegisterOtpRequestBodyModelToJson(this);
}
