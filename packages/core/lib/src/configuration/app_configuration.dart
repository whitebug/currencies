import 'package:core/src/configuration/configuration.dart';
import 'package:flutter/material.dart';

/// Provides config to the app. T is a return type of a config
class AppConfiguration<T> implements Listenable {
  // ignore:cast_nullable_to_non_nullable
  factory AppConfiguration.instance() => _instance as AppConfiguration<T>;
  AppConfiguration._(this._currentConfigurationMode, T config)
      : _configuration = ValueNotifier(config);

  static AppConfiguration<dynamic>? _instance;
  final ConfigurationMode _currentConfigurationMode;
  ValueNotifier<T> _configuration;

  T get configuration => _configuration.value;

  set configuration(T c) {
    _configuration.value = c;
  }

  /// Release mode
  bool get isRelease => _currentConfigurationMode == ConfigurationMode.release;

  /// Debug mode
  bool get isDebug => _currentConfigurationMode == ConfigurationMode.debug;

  /// Current configuration mode of an app
  ConfigurationMode get buildType => _currentConfigurationMode;

  @override
  void addListener(VoidCallback listener) {
    _configuration.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _configuration.removeListener(listener);
  }

  /// Initializing the environment.
  static void init<T>({
    required ConfigurationMode configurationMode,
    required T configuration,
  }) {
    _instance ??= AppConfiguration<T>._(configurationMode, configuration);
  }
}
