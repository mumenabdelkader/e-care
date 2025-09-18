// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_reqsuest_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterReqsuestBodyModel _$RegisterReqsuestBodyModelFromJson(
  Map<String, dynamic> json,
) => RegisterReqsuestBodyModel(
  userName: json['userName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$RegisterReqsuestBodyModelToJson(
  RegisterReqsuestBodyModel instance,
) => <String, dynamic>{
  'userName': instance.userName,
  'email': instance.email,
  'password': instance.password,
};
