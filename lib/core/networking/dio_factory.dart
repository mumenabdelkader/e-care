import 'package:clinic/core/constants/cache_constants.dart';
import 'package:clinic/core/utils/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constant.dart';

class DioFactory {
  final Dio _dio;
  Dio get dio => _dio;

  DioFactory() : _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl)) {
    _dio.options
      ..connectTimeout = const Duration(minutes: 1)
      ..receiveTimeout = const Duration(minutes: 1)
      ..sendTimeout = const Duration(minutes: 5);

    // ==================
    // Attach Token + Refresh
    // ==================
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final requiresToken = options.extra["requiresToken"] ?? true;

          // Endpoints that don't need token
          final noAuthEndpoints = [
            ApiConstant.loginEp,
            ApiConstant.registerEp,
            ApiConstant.verifyRegisterOtpEP,
            ApiConstant.forgotPasswordEmailEP,
            ApiConstant.verifyPasswordRestOtpEP,
            ApiConstant.restPasswordEP,
            ApiConstant.generateNewTokenEp,
          ];

          if (requiresToken && !noAuthEndpoints.contains(options.path)) {
            final accessToken = await CacheHelper.getSecureData(
              key: CacheConstants.accessToken,
            );
            if (accessToken != null) {
              options.headers['Authorization'] = 'Bearer $accessToken';
            }
          }

          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            try {
              final newToken = await _refreshToken();

              if (newToken != null) {
                // Save new token
                await CacheHelper.setSecureData(
                  key: CacheConstants.accessToken,
                  value: newToken,
                );

                // Retry request
                final requestOptions = error.requestOptions;
                requestOptions.headers['Authorization'] = 'Bearer $newToken';

                final cloneReq = await _dio.fetch(requestOptions);
                return handler.resolve(cloneReq);
              }
            } catch (e) {
              debugPrint("❌ Refresh token failed: $e");
              return handler.reject(error);
            }
          }
          return handler.next(error);
        },
      ),
    );

    // ==================
    // Logger
    // ==================
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
  }

  // ==================
  // Refresh Token Logic
  // ==================
  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await CacheHelper.getSecureData(
        key: CacheConstants.refreshToken,
      );

      if (refreshToken == null) return null;

      final response = await _dio.post(
        ApiConstant.generateNewTokenEp,
        data: {"refreshToken": refreshToken},
        options: Options(extra: {"requiresToken": false}),
      );

      // ⚠️ تأكد من اسم الفيلد اللي راجع من الـ API
      return response.data['token'] as String?;
    } catch (e) {
      debugPrint("❌ Error while refreshing token: $e");
      return null;
    }
  }
}
