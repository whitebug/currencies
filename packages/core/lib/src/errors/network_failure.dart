import 'package:core/src/errors/failures.dart';

/// Typedef
typedef NetworkFailureFactory = NetworkFailure Function({
  required int statusCode,
  String? message,
});

/// Network failure
abstract class NetworkFailure extends Failure {
  /// Factory
  factory NetworkFailure({
    required int statusCode,
    String? message,
  }) {
    assert(
      isFailureStatusCode(statusCode),
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

  const NetworkFailure._internal({
    required this.statusCode,
    this.message,
  });

  static const Map<int, NetworkFailureFactory>
      _networkFailureFactoriesBasedOnHttpStatusCode =
      <int, NetworkFailureFactory>{
    400: BadRequestFailure._internal,
    401: UnauthorizedFailure._internal,
    403: ForbiddenFailure._internal,
    404: NotFoundFailure._internal,
    405: MethodNotAllowedFailure._internal,
    429: TooManyRequestsFailure._internal,
    500: ServerFailure._internal,
    501: ServerFailure._internal,
    502: ServerFailure._internal,
    503: ServerFailure._internal,
    504: ServerFailure._internal,
  };

  /// Either 400 or 522
  static bool isFailureStatusCode(int statusCode) =>
      statusCode >= 400 && statusCode <= 511;

  /// Status code
  final int statusCode;

  /// Message
  final String? message;

  @override
  String toString() {
    var result = 'NetworkFailure: $runtimeType code: $statusCode.';

    if (message != null) {
      result += 'message:  $message';
    }

    return result;
  }
}

/// BadRequestFailure
class BadRequestFailure extends NetworkFailure {
  const BadRequestFailure._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();

  @override
  List<Object?> get props => [statusCode, message];
}

/// UnauthorizedFailure
class UnauthorizedFailure extends NetworkFailure {
  const UnauthorizedFailure._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();

  @override
  List<Object?> get props => [statusCode, message];
}

/// ForbiddenFailure
class ForbiddenFailure extends NetworkFailure {
  const ForbiddenFailure._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();

  @override
  List<Object?> get props => [statusCode, message];
}

/// NotFoundFailure
class NotFoundFailure extends NetworkFailure {
  const NotFoundFailure._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();

  @override
  List<Object?> get props => [statusCode, message];
}

/// MethodNotAllowedFailure
class MethodNotAllowedFailure extends NetworkFailure {
  const MethodNotAllowedFailure._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();

  @override
  List<Object?> get props => [statusCode, message];
}

/// TooManyRequestsFailure
class TooManyRequestsFailure extends NetworkFailure {
  const TooManyRequestsFailure._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();

  @override
  List<Object?> get props => [statusCode, message];
}

/// ServerFailure
class ServerFailure extends NetworkFailure {
  const ServerFailure._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();

  @override
  List<Object?> get props => [statusCode, message];
}

/// _MinorNetworkFailure
class _MinorNetworkFailure extends NetworkFailure {
  const _MinorNetworkFailure._internal({
    required super.statusCode,
    super.message,
  }) : super._internal();

  @override
  List<Object?> get props => [statusCode, message];
}
