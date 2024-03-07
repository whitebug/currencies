import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/src/repositories/repositories.dart';

class GetCurrenciesUseCase implements UseCase<Map<String, String>, NoParams> {
  GetCurrenciesUseCase({required this.repository});

  final ExchangeRepository repository;

  @override
  Future<Either<Failure, Map<String, String>>> call(
      NoParams params,
      ) async {
    return repository.currencies();
  }
}
