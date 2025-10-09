// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get-available-doctors_respons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAvailableDoctorsResponseModel _$GetAvailableDoctorsResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAvailableDoctorsResponseModel(
  doctorId: json['doctorId'] as String?,
  fullName: json['fullName'] as String?,
  specialty: json['specialty'] as String?,
  availableVisitTypes:
      (json['availableVisitTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$GetAvailableDoctorsResponseModelToJson(
  GetAvailableDoctorsResponseModel instance,
) => <String, dynamic>{
  'doctorId': instance.doctorId,
  'fullName': instance.fullName,
  'specialty': instance.specialty,
  'availableVisitTypes': instance.availableVisitTypes,
};
