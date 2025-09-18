import 'package:json_annotation/json_annotation.dart';

part 'register_response_body.g.dart';

@JsonSerializable()
class RegisterResponseBody {
  final bool success;
  final String? message;
  final dynamic errors;

  RegisterResponseBody({
    required this.success,
    required this.message,
    required this.errors,
  });
  factory RegisterResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseBodyToJson(this);
}
