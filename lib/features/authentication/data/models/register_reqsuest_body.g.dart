// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_reqsuest_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterReqsuestBody _$RegisterReqsuestBodyFromJson(
  Map<String, dynamic> json,
) => RegisterReqsuestBody(
  userName: json['userName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$RegisterReqsuestBodyToJson(
  RegisterReqsuestBody instance,
) => <String, dynamic>{
  'userName': instance.userName,
  'email': instance.email,
  'password': instance.password,
};
