import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/router/custom_router.dart';
import 'package:mobile/router/initialize_route.dart';
import 'package:provider/provider.dart';

import 'api/ApiClient.dart';
import 'common/providers/search_quiz_provider.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeEnvironment(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _showMaterialRouter(snapshot.data!);
        } else {
          return const MaterialApp(
            title: 'Interactive Learning',
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

Widget _showMaterialRouter(String initialRoute) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<SearchScreenProvider>(
          create: (_) => SearchScreenProvider()),
    ],
    child: MaterialApp.router(
      title: 'Interactive Learning',
      routerConfig: CustomRouter(initialRoute: initialRoute),
      debugShowCheckedModeBanner: false,
    ),
  );
}

Future<String> _initializeEnvironment() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

  String initialRoute = await getInitialRoute();
  if (initialRoute == '/') {
    NotificationsEndpointApi(apiClient).registerOrUpdateDeviceToken(
        RegisterOrUpdateDeviceTokenRequest(token: fcmToken));
  }
  return initialRoute;
}
