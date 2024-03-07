import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:exchange/features/main/blocs/blocs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:net/net.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Locator instance
final getIt = GetIt.instance;

/// Locator initialization
Future<void> setLocator() async {
  /// Data sources
  getIt
    ..registerLazySingleton<ExchangeDatasource>(
      () => ExchangeDatasourceImpl(
        exClient: getIt<ExClient>(),
      ),
    )

    /// Repositories
    ..registerLazySingleton<ExchangeRepository>(
      () => ExchangeRepositoryImpl(
        exchangeDatasource: getIt<ExchangeDatasource>(),
      ),
    )

    /// Use cases
    ..registerLazySingleton<GetLatestUseCase>(
      () => GetLatestUseCase(
        repository: getIt<ExchangeRepository>(),
      ),
    )
    ..registerLazySingleton<GetCurrenciesUseCase>(
      () => GetCurrenciesUseCase(
        repository: getIt<ExchangeRepository>(),
      ),
    )

    /// Blocs
    ..registerFactory<MainCubit>(
      () => MainCubit(
        getCurrenciesUseCase: getIt<GetCurrenciesUseCase>(),
      ),
    );

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt
    ..registerLazySingleton<ExClient>(
      () => ExClient(
        dio: getIt<Dio>(),
        baseUrl: AppConfiguration<ConfigurationDetails>.instance()
            .configuration
            .serverUrl,
      ),
    )
    ..registerSingleton<SharedPreferences>(
      sharedPreferences,
    )
    ..registerSingleton<Dio>(Dio())
    ..registerLazySingleton<FlutterSecureStorage>(exSecureStorage);
}
