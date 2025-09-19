// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_register_otp_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRegisterOtpRequestBodyModel _$VerifyRegisterOtpRequestBodyModelFromJson(
  Map<String, dynamic> json,
) => VerifyRegisterOtpRequestBodyModel(
  email: json['email'] as String,
  otpCode: json['otpCode'] as String,
);

Map<String, dynamic> _$VerifyRegisterOtpRequestBodyModelToJson(
  VerifyRegisterOtpRequestBodyModel instance,
) => <String, dynamic>{'email': instance.email, 'otpCode': instance.otpCode};
