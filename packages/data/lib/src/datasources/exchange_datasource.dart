import 'package:core/core.dart';
import 'package:net/net.dart';

abstract class ExchangeDatasource {
  Future<Map<String, String>?> currencies();
}

class ExchangeDatasourceImpl implements ExchangeDatasource {
  ExchangeDatasourceImpl({
    required this.exClient,
  });

  final ExClient exClient;

  @override
  Future<Map<String, String>?> currencies() async {
    final response = await exClient.client.get<Map<String, dynamic>>(
      '/api/currencies.json',
    );
    if (response.statusCode == 200 && response.data != null) {
      final result = <String, String>{};
      response.data!.forEach((key, value) {
        result[key] = value as String;
      });
      return result;
    } else {
      throw NetworkException(statusCode: response.statusCode ?? 500);
    }
  }
}
