import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class ExchangeRepository {
  Future<Either<Failure, bool>> latest();
  Future<Either<Failure, Map<String, String>>> currencies();
  Future<Either<Failure, bool>> convert();
}
