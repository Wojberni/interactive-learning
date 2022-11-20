import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/router/custom_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'api/ApiClient.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  String initialRoute = await getInitialRoute();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
  runApp(MyApp(initialRoute: initialRoute));
      });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Interactive Learning',
      routerConfig: CustomRouter(initialRoute: initialRoute),
    );
  }
}

Future<String> getInitialRoute() async {
  String initialRoute = '/auth/login';
  var storage = const FlutterSecureStorage();
  await storage.read(key: 'token').then((value) {
    if (value != null) {
      initialRoute = '/home';
      apiClient.addDefaultHeader(
          "Authorization", "Bearer $value");
    }
  });
  return initialRoute;
}