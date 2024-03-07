import 'dart:io';
import 'package:dio/dio.dart';
import 'package:net/src/ex_auth_token.dart';
import 'package:net/src/ex_client.dart';

class ExAuthInterceptor extends Interceptor {
  ExAuthInterceptor({
    required ExAuthToken exAuthToken,
    required ExClient exClient,
  })  : _exAuthToken = exAuthToken,
        _exClient = exClient;
  final ExAuthToken _exAuthToken;
  final ExClient _exClient;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = _exAuthToken.token();
    if (token != null) {
      options.headers['Authorization'] = 'Token $token}';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final token = await _exAuthToken.updateToken();
      if (token != null) {
        final requestOptions = err.requestOptions;
        requestOptions.headers['Authorization'] = 'Token $token}';
        try {
          handler
              .resolve(await _exClient.client.fetch<Object?>(requestOptions));
        } on DioException catch (e) {
          handler.reject(e);
        }
        return;
      }
    }
    handler.next(err);
  }
}
