import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/src/repositories/repositories.dart';

class GetLatestUseCase implements UseCase<bool, NoParams> {
  GetLatestUseCase({required this.repository});

  final ExchangeRepository repository;

  @override
  Future<Either<Failure, bool>> call(
      NoParams params,
      ) async {
    return repository.latest();
  }
}
