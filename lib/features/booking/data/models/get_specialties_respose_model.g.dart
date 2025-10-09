// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_specialties_respose_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSpecialtiesResposeModel _$GetSpecialtiesResposeModelFromJson(
  Map<String, dynamic> json,
) => GetSpecialtiesResposeModel(
  specialtyId: (json['specialtyId'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$GetSpecialtiesResposeModelToJson(
  GetSpecialtiesResposeModel instance,
) => <String, dynamic>{
  'specialtyId': instance.specialtyId,
  'name': instance.name,
};
