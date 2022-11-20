import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/api_error_codes.dart';
import 'package:mobile/login_register/widgets/custom_elevated_button.dart';
import 'package:mobile/login_register/widgets/custom_validation_extension.dart';

import '../../api/ApiClient.dart';
import '../../api/api_error_response.dart';
import '../../common/helpers/snackbar.dart';
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

    return Scaffold(
      backgroundColor: _backgroundColor,
      resizeToAvoidBottomInset: true,
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
              validator: (value) => validateLoginInput(value),
            ),
            CustomFormField(
              hintText: 'Email',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
                LengthLimitingTextInputFormatter(30),
              ],
              validator: (value) => validateEmailInput(value),
            ),
            CustomFormField(
              hintText: 'Hasło',
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
              ],
              secret: true,
              validator: (value) {},
            ),
            CustomFormField(
              hintText: 'Powtórz hasło',
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
              ],
              secret: true,
              validator: (value) => validatePasswordConfirmationInput(value),
            ),
            Builder(
                builder: (context) => CustomElevatedButton(
                    title: 'Zarejestruj się',
                    onPressed: () => handleRegister())),
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
    );
  }

  void handleRegister() {
    var apiErrorResponse = ApiErrorResponse();
    if (_formKey.currentState!.validate()) {
      AuthEndpointApi(apiClient)
          .register(RegisterUserRequest(
              email: _email, username: _login, password: _password))
          .then((res) => context.go('auth/login'))
          .catchError((err) => {
                if (err.code == 400)
                  {
                    apiErrorResponse.fromRawError(err.message),
                    if (apiErrorResponse.errorCode ==
                        ApiErrorCodes.emailExistsError)
                      {
                        showSnackBar(
                            context, "Email istnieje!", SnackBarType.error),
                      }
                    else if (apiErrorResponse.errorCode ==
                        ApiErrorCodes.usernameExistsError)
                      {
                        showSnackBar(
                            context, "Login istnieje!", SnackBarType.error),
                      }
                    else
                      {
                        showSnackBar(
                            context, "Coś poszło nie tak!", SnackBarType.error)
                      }
                  }
              });
    }
  }

  String? validateLoginInput(String? value) {
    if (value!.isEmpty) {
      return "Wpisz login!";
    } else if (!value.isValidName) {
      return "Wpisz poprawny login!";
    } else {
      _login = value;
      return null;
    }
  }

  String? validateEmailInput(String? value) {
    if (value!.isEmpty) {
      return "Wpisz email!";
    } else if (!value.isValidEmail) {
      return "Wpisz poprawny email!";
    } else {
      _email = value;
      return null;
    }
  }

  String? validatePasswordInput(String? value) {
    if (value!.isEmpty) {
      return "Wpisz hasło!";
    } else if (!value.isValidPassword) {
      return "Hasło musi zawierać wielką i małą literę,\n"
          "znak specjalny, cyfrę oraz co najmniej 8 znaków!";
    } else {
      _password = value;
      return null;
    }
  }

  String? validatePasswordConfirmationInput(String? value) {
    if (value!.isEmpty) {
      return "Wpisz hasło!";
    } else if (value != _password) {
      return "Hasła nie są takie same!";
    } else {
      return null;
    }
  }
}
