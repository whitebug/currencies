import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class ExchangeRepositoryImpl implements ExchangeRepository {
  ExchangeRepositoryImpl({required this.exchangeDatasource});

  final ExchangeDatasource exchangeDatasource;

  @override
  Future<Either<Failure, bool>> convert() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, String>>> currencies() async {
    try {
      final result = await exchangeDatasource.currencies();
      if (result != null) {
        return Right<Failure, Map<String, String>>(result);
      }
      return Left<Failure, Map<String, String>>(AuthFailure());
    } on NetworkException catch (e) {
      return Left<Failure, Map<String, String>>(
        NetworkFailure(
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> latest() {
    throw UnimplementedError();
  }
}
