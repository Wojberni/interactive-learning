import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/login_register/widgets/custom_elevated_button.dart';
import 'package:mobile/login_register/widgets/custom_validation_extension.dart';

import '../../api/ApiClient.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_layout_header.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _backgroundColor = const Color(0xFF090546);
  String _login = "";
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: _backgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              const CustomHeaderLoginRegister("Rejestracja"),
              CustomFormField(
                hintText: 'Login',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  LengthLimitingTextInputFormatter(30),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Wpisz login!";
                  } else if (!value.isValidName) {
                    return "Wpisz poprawny login!";
                  } else {
                    _login = value;
                    return null;
                  }
                },
              ),
              CustomFormField(
                hintText: 'Email',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
                  LengthLimitingTextInputFormatter(30),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Wpisz email!";
                  } else if (!value.isValidEmail) {
                    return "Wpisz poprawny email!";
                  } else {
                    _email = value;
                    return null;
                  }
                },
              ),
              CustomFormField(
                hintText: 'Hasło',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                secret: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Wpisz hasło!";
                  } else if (!value.isValidPassword) {
                    return "Wpisz poprawne hasło!";
                  } else {
                    _password = value;
                    return null;
                  }
                },
              ),
              CustomFormField(
                hintText: 'Powtórz hasło',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                secret: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Wpisz hasło!";
                  } else if (!value.isValidPassword) {
                    return "Wpisz poprawne hasło!";
                  } else if (value != _password) {
                    return "Hasła nie są takie same!";
                  } else {
                    return null;
                  }
                },
              ),
              CustomElevatedButton(
                  title: 'Zarejestruj się',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //TODO: send registration form with email
                      AuthEndpointApi(apiClient).register(RegisterUserRequest(email: _email,
                          username: _login, password: _password));
                      context.go('/auth/login');
                    }
                  }),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: screenHeight * 0.01),
                  child: GestureDetector(
                    onTap: () => context.go('/auth/login'),
                    child: SizedBox(
                      width: screenWidth,
                      child: const Text(
                        'Powrót do ekranu logowania',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )),
            ]),
          ),
        )),
      ),
    );
  }
}
