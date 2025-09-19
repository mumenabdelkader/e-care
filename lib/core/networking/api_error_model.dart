import 'package:flutter/material.dart';

class ApiErrorModel {
  final int? statusCode;
  final String? message;
  final List<dynamic>? errors;
  final IconData? icon;

  ApiErrorModel({
    required this.statusCode,
    required this.message,
    required this.errors,
    required this.icon,
  });

  /// Factory constructor to build from JSON (robust to different shapes)
  factory ApiErrorModel.fromJson(Map<String, dynamic> json, {int? statusCode}) {
    // extract message if present
    String? message =
        (json['message'] is String) ? json['message'] as String : null;

    // normalize errors into a List<String>
    List<String> parsedErrors = [];

    final rawErrors = json['errors'] ?? json['error'] ?? json['errors_map'];

    if (rawErrors is List) {
      parsedErrors =
          rawErrors
              .map((e) => e?.toString() ?? '')
              .where((s) => s.isNotEmpty)
              .toList();
    } else if (rawErrors is Map) {
      // map of field -> [errors]
      parsedErrors =
          rawErrors.values
              .expand((v) {
                if (v is List) return v.map((e) => e?.toString() ?? '');
                return [v?.toString() ?? ''];
              })
              .where((s) => s.isNotEmpty)
              .toList();
    } else if (rawErrors != null) {
      parsedErrors = [rawErrors.toString()];
    }

    // fallback message: prefer explicit message, otherwise join errors, otherwise null
    final fallbackMessage =
        message ?? (parsedErrors.isNotEmpty ? parsedErrors.join('\n') : null);

    return ApiErrorModel(
      statusCode: statusCode,
      message: fallbackMessage,
      errors: parsedErrors,
      icon: Icons.error, // default icon; can be overridden by handler if needed
    );
  }
}
