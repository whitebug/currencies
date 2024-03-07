import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuration_details.freezed.dart';

@freezed
class ConfigurationDetails with _$ConfigurationDetails {
  const factory ConfigurationDetails({
    required String serverUrl,
    required bool enableLog,
  }) = _ConfigurationDetails;
}
