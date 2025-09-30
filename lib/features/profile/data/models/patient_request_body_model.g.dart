// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientRequestBodyModel _$PatientRequestBodyModelFromJson(
  Map<String, dynamic> json,
) => PatientRequestBodyModel(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  gender: json['gender'] as String,
  dateOfBirth: const DateTimeConverter().fromJson(
    json['dateOfBirth'] as String,
  ),
  address: json['address'] as String?,
  province: json['province'] as String?,
  city: json['city'] as String?,
);

Map<String, dynamic> _$PatientRequestBodyModelToJson(
  PatientRequestBodyModel instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'gender': instance.gender,
  'dateOfBirth': const DateTimeConverter().toJson(instance.dateOfBirth),
  'address': instance.address,
  'province': instance.province,
  'city': instance.city,
};
