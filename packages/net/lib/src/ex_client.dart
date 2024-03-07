import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:net/src/ex_auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ExClient {
  ExClient({
    required Dio dio,
    required String baseUrl,
    Duration timeout = const Duration(seconds: 10),
    ExAuthInterceptor? exAuthInterceptor,
  }) : _dio = dio {
    dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout
      ..contentType = 'application/json';

    dio.interceptors.addAll([
      if (exAuthInterceptor != null)
        QueuedInterceptorsWrapper(
          onRequest: exAuthInterceptor.onRequest,
          onError: exAuthInterceptor.onError,
        ),
      RetryInterceptor(dio: dio),
      if (AppConfiguration<ConfigurationDetails>.instance()
          .configuration
          .enableLog)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
    ]);
  }

  final Dio _dio;

  Dio get client => _dio;
}
