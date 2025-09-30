// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updata_patient_profile_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdataPatientProfileRequestBodyModel
_$UpdataPatientProfileRequestBodyModelFromJson(Map<String, dynamic> json) =>
    UpdataPatientProfileRequestBodyModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: json['gender'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      address: json['address'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$UpdataPatientProfileRequestBodyModelToJson(
  UpdataPatientProfileRequestBodyModel instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'gender': instance.gender,
  'dateOfBirth': instance.dateOfBirth,
  'address': instance.address,
  'province': instance.province,
  'city': instance.city,
  'userName': instance.userName,
  'email': instance.email,
  'password': instance.password,
  'phoneNumber': instance.phoneNumber,
};
