import 'package:json_annotation/json_annotation.dart';
part 'forgot-password_body_model.g.dart';
@JsonSerializable()
class ForgotPasswordBodyModel {
  final String email;

  ForgotPasswordBodyModel({required this.email});

  /// factory.
  factory ForgotPasswordBodyModel.fromJson(Map<String, dynamic> json) => _$ForgotPasswordBodyModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForgotPasswordBodyModelToJson(this);
}