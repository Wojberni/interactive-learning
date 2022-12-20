import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/login_register/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../api/ApiClient.dart';
import '../../common/helpers/snackbar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_layout_header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _backgroundColor = const Color(0xFF090546);
  final _storage = const FlutterSecureStorage();

  String _login = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: _backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              const CustomHeaderLoginRegister("Logowanie"),
              CustomFormField(
                hintText: 'Login',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                validator: (value) => validateLoginInput(value),
              ),
              CustomFormField(
                hintText: 'Hasło',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                validator: (value) => validatePasswordInput(value),
                secret: true,
              ),
              Builder(
                  builder: (context) => CustomElevatedButton(
                        title: 'Zaloguj się',
                        onPressed: () => handleLogin(),
                      )),
              CustomElevatedButton(
                title: 'Rejestracja',
                onPressed: () => context.goNamed('register'),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void handleLogin() {
    int id;
    Map<String, dynamic> payload;
    String fcmToken;
    if (_formKey.currentState!.validate()) {
      AuthEndpointApi(apiClient)
          .login(LoginUserRequest(username: _login, password: _password))
          .then((value) async => {
                apiClient.addDefaultHeader(
                    "Authorization", "Bearer ${value?.token}"),
                await _storage.write(key: 'token', value: value?.token),
                payload = JwtDecoder.decode(value!.token),
                id = payload['id'],
                await _storage.write(key: 'id', value: id.toString()),
                fcmToken = await FirebaseMessaging.instance.getToken() ?? '',
                NotificationsEndpointApi(apiClient).registerOrUpdateDeviceToken(
                    RegisterOrUpdateDeviceTokenRequest(token: fcmToken)),
                showSnackBar(
                    context, 'Zalogowano użytkownika!', SnackBarType.success),
                context.read<AuthProvider>().setAuthenticated(true),
                context.goNamed("home")
              })
          .catchError((err) => {
                if (err.code == 403)
                  {
                    showSnackBar(context, "Niepoprawny login lub hasło!",
                        SnackBarType.error)
                  }
              });
    }
  }

  String? validateLoginInput(String? value) {
    if (value!.isEmpty) {
      return "Wpisz login!";
    } else {
      _login = value;
      return null;
    }
  }

  String? validatePasswordInput(String? value) {
    if (value!.isEmpty) {
      return "Wpisz hasło!";
    } else {
      _password = value;
      return null;
    }
  }
}
