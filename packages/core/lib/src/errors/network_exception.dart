/// Extension typedef
typedef NetworkExceptionFactory = NetworkException Function({
  required int statusCode,
  String? message,
});

/// Network extension
abstract class NetworkException implements Exception {
  /// Constructor
  factory NetworkException({
    required int statusCode,
    String? message,
  }) {
    assert(
      isExceptionStatusCode(statusCode),
      '$statusCode is not a failure status code',
    );

    final majorNetworkFailureFactory =
        _networkFailureFactoriesBasedOnHttpStatusCode[statusCode];

    return majorNetworkFailureFactory != null
        ? majorNetworkFailureFactory(message: message, statusCode: statusCode)
        : _MinorNetworkFailure._internal(
            statusCode: statusCode,
            message: message,
          );
  }

  NetworkException._internal({
    required this.statusCode,
    this.message,
  });

  static const Map<int, NetworkExceptionFactory>
      _networkFailureFactoriesBasedOnHttpStatusCode =
      <int, NetworkExceptionFactory>{
    400: BadRequestException._internal,
    401: UnauthorizedException._internal,
    403: ForbiddenException._internal,
    404: NotFoundException._internal,
    405: MethodNotAllowedException._internal,
    429: TooManyRequestsException._internal,
    500: ServerException._internal,
    501: ServerException._internal,
    502: ServerException._internal,
    503: ServerException._internal,
    504: ServerException._internal,
  };

  /// Either exception is 400 or 511
  static bool isExceptionStatusCode(int statusCode) =>
      statusCode >= 400 && statusCode <= 511;

  /// Status code
  final int statusCode;

  /// Exception message
  final String? message;

  @override
  String toString() {
    var result = 'NetworkException: $runtimeType code: $statusCode.';

    if (message != null) {
      result += 'message:  $message';
    }

    return result;
  }
}

/// BadRequestException
class BadRequestException extends NetworkException {
  BadRequestException._internal({required super.statusCode, super.message})
      : super._internal();
}

/// UnauthorizedException
class UnauthorizedException extends NetworkException {
  UnauthorizedException._internal({required super.statusCode, super.message})
      : super._internal();
}

/// ForbiddenException
class ForbiddenException extends NetworkException {
  ForbiddenException._internal({required super.statusCode, super.message})
      : super._internal();
}

/// NotFoundException
class NotFoundException extends NetworkException {
  NotFoundException._internal({required super.statusCode, super.message})
      : super._internal();
}

/// MethodNotAllowedException
class MethodNotAllowedException extends NetworkException {
  MethodNotAllowedException._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();
}

/// TooManyRequestsException
class TooManyRequestsException extends NetworkException {
  TooManyRequestsException._internal({required super.statusCode, super.message})
      : super._internal();
}

/// ServerException
class ServerException extends NetworkException {
  ServerException._internal({required super.statusCode, super.message})
      : super._internal();
}

/// _MinorNetworkFailure
class _MinorNetworkFailure extends NetworkException {
  _MinorNetworkFailure._internal({required super.statusCode, super.message})
      : super._internal();
}
