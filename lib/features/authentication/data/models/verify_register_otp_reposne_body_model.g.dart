// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_register_otp_reposne_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRegisterOtpReposneBodyModel _$VerifyRegisterOtpReposneBodyModelFromJson(
  Map<String, dynamic> json,
) => VerifyRegisterOtpReposneBodyModel(
  token: json['token'] as String?,
  tokenExpiration: json['tokenExpiration'] as String?,
  refreshToken: json['refreshToken'] as String?,
  refreshTokenExpiration: json['refreshTokenExpiration'] as String?,
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  errors: json['errors'] as List<dynamic>?,
);

Map<String, dynamic> _$VerifyRegisterOtpReposneBodyModelToJson(
  VerifyRegisterOtpReposneBodyModel instance,
) => <String, dynamic>{
  'token': instance.token,
  'tokenExpiration': instance.tokenExpiration,
  'refreshToken': instance.refreshToken,
  'refreshTokenExpiration': instance.refreshTokenExpiration,
  'user': instance.user,
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
