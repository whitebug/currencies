import 'dart:async';
import 'dart:developer';

import 'package:exchange/app/app_bloc_observer.dart';
import 'package:exchange/app/app_init.dart';
import 'package:exchange/app/locator.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:net/net.dart';

/// App launch.
Future<void> runner() async {
  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await setLocator();
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
      Bloc.observer = AppBlocObserver();
      await dotenv.load();
      await const FlutterSecureStorage().write(
        key: ExConstants.storageTokenKey,
        value: dotenv.env[ExConstants.envTokenKey],
      );
      runApp(const AppInit());
    },
    (exception, stack) {
      log(exception.toString(), stackTrace: stack);
    },
  );
}
