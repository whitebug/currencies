import 'package:core/core.dart';
import 'package:exchange/runner.dart';

/// Main entry point of app.
void main() {
  AppConfiguration.init(
    configurationMode: ConfigurationMode.release,
    configuration: const ConfigurationDetails(
      serverUrl: 'https://openexchangerates.org',
      enableLog: false,
    ),
  );

  runner();
}
