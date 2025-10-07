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
      dateOfBirth: const DateTimeConverter().fromJson(
        json['dateOfBirth'] as String,
      ),
      address: json['address'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      userName: json['userName'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$UpdataPatientProfileRequestBodyModelToJson(
  UpdataPatientProfileRequestBodyModel instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'gender': instance.gender,
  'dateOfBirth': const DateTimeConverter().toJson(instance.dateOfBirth),
  'address': instance.address,
  'province': instance.province,
  'city': instance.city,
  'userName': instance.userName,
  'phoneNumber': instance.phoneNumber,
};
