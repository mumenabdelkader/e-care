// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_respons_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBodyModel _$LoginResponseBodyModelFromJson(
  Map<String, dynamic> json,
) => LoginResponseBodyModel(
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
  errors: json['errors'] as String?,
);

Map<String, dynamic> _$LoginResponseBodyModelToJson(
  LoginResponseBodyModel instance,
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

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  userName: json['userName'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'email': instance.email,
};
