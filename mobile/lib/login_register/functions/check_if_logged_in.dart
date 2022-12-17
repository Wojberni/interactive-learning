
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../api/ApiClient.dart';

Future<bool> checkIfLoggedIn() async {
  bool isLoggedIn = false;
  var storage = const FlutterSecureStorage();
  await storage.read(key: 'token').then((value) {
    if (value == null || JwtDecoder.isExpired(value)) {
      isLoggedIn = false;
    }
    else{
      apiClient.addDefaultHeader(
          "Authorization", "Bearer $value");
      isLoggedIn = true;
    }
  });
  return isLoggedIn;
}
