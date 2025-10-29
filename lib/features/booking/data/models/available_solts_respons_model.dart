import 'package:json_annotation/json_annotation.dart';

part 'available_solts_respons_model.g.dart';

@JsonSerializable()
class AvailableSlotsResponsModel {
  String? date;
  List<TimeSlots>? timeSlots;

  AvailableSlotsResponsModel({this.date, this.timeSlots});

  factory AvailableSlotsResponsModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableSlotsResponsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableSlotsResponsModelToJson(this);
}

@JsonSerializable()
class TimeSlots {
  String? startTime;
  bool? isAvailable;

  TimeSlots({this.startTime, this.isAvailable});

  factory TimeSlots.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotsFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotsToJson(this);
}
