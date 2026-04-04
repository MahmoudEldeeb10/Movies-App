import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        queryParameters: {'api_key': 'a9ad3393eba6ee3461adb160f3cfd2dd'},
      ),
    );

    // ✅ Log بس في debug mode
    if (kDebugMode) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            debugPrint('┌─────────────────────────────────');
            debugPrint('│ [API] REQUEST: ${options.method} ${options.uri}');
            debugPrint('│ [API] HEADERS: ${options.headers}');
            debugPrint('└─────────────────────────────────');
            handler.next(options);
          },
          onResponse: (response, handler) {
            debugPrint('┌─────────────────────────────────');
            debugPrint('│ [API] RESPONSE: ${response.statusCode}');
            debugPrint('│ [API] DATA: ${response.data}');
            debugPrint('└─────────────────────────────────');
            handler.next(response);
          },
          onError: (error, handler) {
            debugPrint('│ [API] ERROR: ${error.message}');
            handler.next(error);
          },
        ),
      );
    }

    return dio;
  }
}
