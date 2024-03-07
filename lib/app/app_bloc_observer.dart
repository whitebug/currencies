import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Observer
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (AppConfiguration<ConfigurationDetails>.instance()
        .configuration
        .enableLog) {
      log('onChange(${bloc.runtimeType}, $change)');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (AppConfiguration<ConfigurationDetails>.instance()
        .configuration
        .enableLog) {
      log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    }
    super.onError(bloc, error, stackTrace);
  }
}
