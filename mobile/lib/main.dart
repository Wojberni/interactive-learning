import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/login_register/functions/check_if_logged_in.dart';
import 'package:mobile/login_register/providers/auth_provider.dart';
import 'package:mobile/router/custom_router.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchScreenProvider>(
            create: (_) => SearchScreenProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: FutureBuilder(
        future: _initializeEnvironmentAndLogIn(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            context.read<AuthProvider>().setAuthenticated(snapshot.data!);
            return _showMaterialRouter(snapshot.data!);
          } else {
            return _showLoadingScreen();
          }
        },
      ),
    );
  }
}

Widget _showMaterialRouter(bool isLoggedIn) {
  return MaterialApp.router(
    title: 'Interactive Learning',
    routerConfig: CustomRouter(loggedIn: isLoggedIn),
    debugShowCheckedModeBanner: false,
  );
}

Widget _showLoadingScreen() {
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

Future<bool> _initializeEnvironmentAndLogIn() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';

  bool loggedIn = await checkIfLoggedIn();
  /*if (loggedIn) {
    NotificationsEndpointApi(apiClient).registerOrUpdateDeviceToken(
        RegisterOrUpdateDeviceTokenRequest(token: fcmToken));
  }*/
  return loggedIn;
}
