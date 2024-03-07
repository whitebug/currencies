import 'package:core/src/errors/failures.dart';

/// Typedef
typedef BioFailureFactory = BioFailure Function({
  required String errorMessage,
});

/// Biometric authentication failure
abstract class BioFailure extends Failure {
  factory BioFailure({
    required String errorMessage,
  }) {
    final majorBioFailureFactory =
        _bioFailureFactoriesBasedOnErrorMessage[errorMessage];

    return majorBioFailureFactory != null
        ? majorBioFailureFactory(errorMessage: errorMessage)
        : _MinorBioFailure._internal(
            errorMessage: errorMessage,
          );
  }

  const BioFailure._internal({
    required this.errorMessage,
  });

  static const Map<String, BioFailureFactory>
      _bioFailureFactoriesBasedOnErrorMessage = <String, BioFailureFactory>{
    'Rejected': RejectedBioFailure._internal,
    'PasscodeNotSet': PasscodeNotSetFailure._internal,
    'NotEnrolled': NotEnrolledFailure._internal,
    'NotAvailable': NotAvailableFailure._internal,
    'OtherOperatingSystem': OtherOperatingSystemFailure._internal,
    'LockedOut': LockedOutFailure._internal,
    'PermanentlyLockedOut': PermanentlyLockedOutFailure._internal,
    'biometricOnlyNotSupported': BiometricOnlyNotSupportedFailure._internal,
    'Unknown': UnknownBioFailure._internal,
  };

  /// Error message
  final String errorMessage;

  @override
  String toString() => 'BioFailure: $runtimeType code: $errorMessage.';
}

/// Biometrics authentication not available or device does not support it
class RejectedBioFailure extends BioFailure {
  const RejectedBioFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Indicates that the user has not yet configured a passcode (iOS) or
/// PIN/pattern/password (Android) on the device.
class PasscodeNotSetFailure extends BioFailure {
  const PasscodeNotSetFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Indicates the user has not enrolled any biometrics on the device.
class NotEnrolledFailure extends BioFailure {
  const NotEnrolledFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Indicates the device does not have hardware support for biometrics.
class NotAvailableFailure extends BioFailure {
  const NotAvailableFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Indicates the device operating system is unsupported.
class OtherOperatingSystemFailure extends BioFailure {
  const OtherOperatingSystemFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Indicates the API is temporarily locked out due to too many attempts.
class LockedOutFailure extends BioFailure {
  const LockedOutFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Indicates the API is locked out more persistently than [LockedOutFailure].
/// Strong authentication like PIN/Pattern/Password is required to unlock.
class PermanentlyLockedOutFailure extends BioFailure {
  const PermanentlyLockedOutFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Indicates that the biometricOnly parameter can't be true on Windows
class BiometricOnlyNotSupportedFailure extends BioFailure {
  const BiometricOnlyNotSupportedFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Unknown biometric error
class UnknownBioFailure extends BioFailure {
  const UnknownBioFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}

/// Minor biometric failure
class _MinorBioFailure extends BioFailure {
  const _MinorBioFailure._internal({
    required super.errorMessage,
  }) : super._internal();

  @override
  List<Object?> get props => [errorMessage];
}
