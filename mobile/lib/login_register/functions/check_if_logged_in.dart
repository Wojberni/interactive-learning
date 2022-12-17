
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../api/ApiClient.dart';

Future<bool> checkIfLoggedIn() async {
  var storage = const FlutterSecureStorage();
  await storage.read(key: 'token').then((value) {
    if (value == null || JwtDecoder.isExpired(value)) {
      return false;
    }
    apiClient.addDefaultHeader('token', value);
    return true;
  });
  return false;
}
