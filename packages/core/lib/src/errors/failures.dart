import 'package:equatable/equatable.dart';

/// Main failure
abstract class Failure extends Equatable {
  /// Constructor
  const Failure();
}

/// Fail to save to the storage
class LocalStorageFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// Failures that happens in authentication
class AuthFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// Image picker failure
class ImagePickerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// Image is too big
class ImageSizeFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// Cannot read faq json
class FaqJsonReadFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// Cannot write to support
class SupportFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// Cannot find default email client
class NoEmailClientFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// There is no quota for passes left
class NoQuotaLeftFailure extends Failure {
  @override
  List<Object?> get props => [];
}
