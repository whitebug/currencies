import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:net/src/ex_constants.dart';

class ExAuthToken {
  ExAuthToken(this._secureStorage) : _isAuth = ValueNotifier(false);
  final FlutterSecureStorage _secureStorage;
  final ValueNotifier<bool> _isAuth;

  ValueListenable<bool> get isAuth => _isAuth;
  String? _token;

  String? token() => _token;

  Future<String?> updateToken() async {
    final token = await _secureStorage.read(key: ExConstants.storageTokenKey);
    _isAuth.value = true;
    return token;
  }

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: ExConstants.storageTokenKey, value: token);
  }
}
