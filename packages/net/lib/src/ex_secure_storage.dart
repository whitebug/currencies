import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage exSecureStorage() {
  return const FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
}
