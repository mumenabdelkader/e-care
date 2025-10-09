import 'package:json_annotation/json_annotation.dart';

part 'get_specialties_respose_model.g.dart';

@JsonSerializable()
class GetSpecialtiesResposeModel {
  int? specialtyId;
  String? name;

  GetSpecialtiesResposeModel({this.specialtyId, this.name});

  factory GetSpecialtiesResposeModel.fromJson(Map<String, dynamic> json) =>
      _$GetSpecialtiesResposeModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetSpecialtiesResposeModelToJson(this);
}