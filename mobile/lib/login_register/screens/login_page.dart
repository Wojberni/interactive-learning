import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_api/api.dart';

import '../../api/ApiClient.dart';
import '../../common/helpers/snackbar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_validation_extension.dart';
import '../widgets/custom_layout_header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _backgroundColor = const Color(0xFF090546);

  String _login = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
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
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                    LengthLimitingTextInputFormatter(30),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Wpisz login!";
                    } else {
                      _login = value;
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  hintText: 'Hasło',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Wpisz hasło!";
                    } else {
                      _password = value;
                      return null;
                    }
                  },
                  secret: true,
                ),
                Builder(
                    builder: (context) => CustomElevatedButton(
                          title: 'Zaloguj się',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AuthEndpointApi(apiClient)
                                  .login(LoginUserRequest(
                                      username: _login, password: _password))
                                  .then((value) => {
                                        apiClient.addDefaultHeader(
                                            "Authorization",
                                            "Bearer ${value?.token}"),
                                            context.go("/home")
                                      })
                                  .catchError((err) => {
                                        if (err.code == 403)
                                          {
                                            showSnackBar(context, "Niepoprawny login lub hasło!", SnackBarType.error)
                                          }
                                      });
                            }
                          },
                        )),
                CustomElevatedButton(
                  title: 'Rejestracja',
                  onPressed: () => context.go('/auth/register'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: screenHeight * 0.02),
                  child: GestureDetector(
                    // onTap: () => context.go('/auth/forgotPassword'),
                    child: SizedBox(
                      width: screenWidth,
                      child: const Text(
                        'Nie pamiętasz hasła?',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
