import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_api/api.dart';

import 'api/ApiClient.dart';
import 'custom_login_register_form_field.dart';
import 'custom_validation_extension.dart';
import 'custom_header_login_register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _backgroundColor = const Color(0xFF090546);
  final _primaryColor = const Color(0xFF82E6FF);
  final _buttonColor = const Color(0xFFD0CECE);
  String login = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final List<String> inputTexts = ["Login", "Haslo"];

    return MaterialApp(
        home: Scaffold(
            backgroundColor: _backgroundColor,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                        children: [
                          const CustomHeaderLoginRegister("Logowanie"),
                          CustomFormField(
                            hintText: inputTexts[0],
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z0-9]')),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Wpisz login!";
                              } else if (!value.isValidName) {
                                return "Wpisz poprawny login!";
                              } else {
                                login = value;
                                return null;
                              }
                            },
                          ),
                          CustomFormField(
                            hintText: inputTexts[1],
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z0-9]')),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Wpisz hasło!";
                              } else if (!value.isValidPassword) {
                                return "Wpisz poprawne hasło!";
                              } else {
                                password = value;
                                return null;
                              }
                            },
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 30, vertical: 1),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: _primaryColor,
                          //       border: Border.all(color: Colors.black),
                          //     ),
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(
                          //           left: 20, right: 20, bottom: 2),
                          //       child: TextFormField(
                          //         onTap: () {
                          //           FocusScope.of(context).unfocus();
                          //           TextEditingController().clear();
                          //         },
                          //         obscureText: false,
                          //         inputFormatters: [
                          //           LengthLimitingTextInputFormatter(15),
                          //         ],
                          //         style: const TextStyle(fontSize: 22),
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Wpisz login!";
                          //           } else if (!RegExp(r'^[a-zA-Z0-9]+$')
                          //               .hasMatch(value)) {
                          //             return "Wpisz poprawny login!";
                          //           } else {
                          //             login = value;
                          //             return null;
                          //           }
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 30, vertical: 1),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: _primaryColor,
                          //       border: Border.all(color: Colors.black),
                          //     ),
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(
                          //           left: 20, right: 20, bottom: 2),
                          //       child: TextFormField(
                          //         onTap: () {
                          //           FocusScope.of(context).unfocus();
                          //           TextEditingController().clear();
                          //         },
                          //         obscureText: true,
                          //         inputFormatters: [
                          //           LengthLimitingTextInputFormatter(20),
                          //         ],
                          //         style: const TextStyle(fontSize: 22),
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Wpisz hasło!";
                          //           } else {
                          //             password = value;
                          //             return null;
                          //           }
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: screenHeight * 0.01),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  AuthEndpointApi(apiClient)
                                      .login(LoginUserRequest(
                                          username: login, password: password))
                                      .then((value) => {
                                            apiClient.addDefaultHeader(
                                                "Authorization",
                                                "Bearer ${value?.token}")
                                          });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: _buttonColor,
                                  minimumSize: Size(
                                      screenWidth * 0.9, screenHeight * 0.11)),
                              child: const Center(
                                child: Text(
                                  'Zaloguj się',
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: screenHeight * 0.01),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('registrationPage');
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: _buttonColor,
                                  minimumSize: Size(
                                      screenWidth * 0.9, screenHeight * 0.11)),
                              child: const Center(
                                child: Text(
                                  'Rejestracja',
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: screenHeight * 0.02),
                            child: GestureDetector(
                              //TODO: go to page with password reset
                              //onTap: () => Navigator.of(context).pushNamed('resetPasswordPage'),
                              child: SizedBox(
                                width: screenWidth,
                                child: const Text(
                                  'Nie pamiętasz hasła?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                ),
              ),
            );
  }
}
