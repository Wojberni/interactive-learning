import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../api/ApiClient.dart';

Future<String> getInitialRoute() async {
  String initialRoute = '/auth/login';
  var storage = const FlutterSecureStorage();
  await storage.read(key: 'token').then((value) {
    if (value == null || JwtDecoder.isExpired(value)) {
      return initialRoute;
    }
    initialRoute = '/';
    apiClient.addDefaultHeader("Authorization", "Bearer $value");
  });
  return initialRoute;
}