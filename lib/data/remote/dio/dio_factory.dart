import 'package:dio/dio.dart';
import 'package:e_election/data/remote/api_constant.dart';

import 'logging_interceptor.dart';

class DioFactory {
  final String _baseUrl = Urls.baseUrl;

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: _baseUrl,
        sendTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      );

  Dio create() => Dio(_createBaseOptions())
    ..interceptors.addAll([
      LoggerInterceptor(),
    ]);
}
