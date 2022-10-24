import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_api/api.dart';

import 'api/ApiClient.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String login="";
  String password="";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body:  SafeArea(
              child: Center(
                  child: Form(
                    key: formKey,
                    child: Container (
                      color: const Color(0xFF090546),
                  child: Center(
                    child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: screenHeight*0.05,
                            ),
                            child: const Center(
                              child: Text(
                                "Logowanie",
                                style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 5,
                              width: screenWidth * 0.85,
                              child: const DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.05),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30
                            ),
                            child: SizedBox(
                              width: screenWidth,
                              child: const Text(
                                'Login',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 1
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF82E6FF),
                                  border: Border.all(color: Colors.black),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                                child: TextFormField(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    TextEditingController().clear();
                                  },
                                  obscureText: false,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(15),
                                    ],
                                  style: const TextStyle(
                                    fontSize: 22
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Wpisz login!";
                                    }
                                    else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                                      return "Wpisz poprawny login!";
                                    }
                                    else {
                                      login=value;
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.03),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30
                            ),
                            child: SizedBox(
                              width: screenWidth,
                              child: const Text(
                                'Hasło',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 1
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF82E6FF),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
                                child: TextFormField(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    TextEditingController().clear();
                                  },
                                  obscureText: true,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(20),
                                  ],
                                  style: const TextStyle(
                                      fontSize: 22
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Wpisz hasło!";
                                    }
                                    else {
                                      password=value;
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight*0.07),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: screenHeight*0.01
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  AuthEndpointApi(apiClient)
                                      .login(LoginUserRequest(username: login, password: password))
                                      .then((value) => {
                                    apiClient.addDefaultHeader("Authorization", "Bearer ${value?.token}")
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD0CECE),
                                  minimumSize: Size(screenWidth*0.9, screenHeight*0.11)
                              ),
                              child: const Center(
                                child: Text(
                                  'Zaloguj się',
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: screenHeight*0.01
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('registrationPage');
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD0CECE),
                                  minimumSize: Size(screenWidth*0.9, screenHeight*0.11)
                              ),
                              child: const Center(
                                child: Text(
                                  'Rejestracja',
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: screenHeight*0.02
                            ),
                            child: GestureDetector(
                              //TODO: go to page with password reset
                              //onTap: () => Navigator.of(context).pushNamed('resetPasswordPage'),
                              child: SizedBox(
                                width: screenWidth,
                                child: const Text(
                                  'Nie pamiętasz hasła?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  )
              ),
                  ),
              ),
            )
        )
    );
  }
}