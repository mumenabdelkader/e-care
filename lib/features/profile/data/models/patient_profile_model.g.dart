// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientProfileModel _$PatientProfileModelFromJson(Map<String, dynamic> json) =>
    PatientProfileModel(
      patientId: json['patientId'] as String,
      userName: json['userName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      gender: json['gender'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      address: json['address'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      photoUrl: json['photoUrl'] as String,
    );

Map<String, dynamic> _$PatientProfileModelToJson(
  PatientProfileModel instance,
) => <String, dynamic>{
  'patientId': instance.patientId,
  'userName': instance.userName,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'gender': instance.gender,
  'dateOfBirth': instance.dateOfBirth.toIso8601String(),
  'address': instance.address,
  'province': instance.province,
  'city': instance.city,
  'photoUrl': instance.photoUrl,
};
