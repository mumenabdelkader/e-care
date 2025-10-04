import 'package:json_annotation/json_annotation.dart';

part 'photo_response_body_model.g.dart';

@JsonSerializable()
class PhotoResponseBodyModel {
  final bool success;
  final String message;
  final List? errors;

  PhotoResponseBodyModel({
    required this.success,
    required this.message,
    required this.errors,
  });
  factory PhotoResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoResponseBodyModelToJson(this);
}
