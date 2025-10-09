import 'package:json_annotation/json_annotation.dart';

part 'get-available-doctors_respons_model.g.dart';

@JsonSerializable()
class GetAvailableDoctorsResponseModel {
  String? doctorId;
  String? fullName;
  String? specialty;
  List<String>? availableVisitTypes;

  GetAvailableDoctorsResponseModel(
      {this.doctorId, this.fullName, this.specialty, this.availableVisitTypes});

  factory GetAvailableDoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAvailableDoctorsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAvailableDoctorsResponseModelToJson(this);
}