import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  String login="";
  String email="";
  String password="";
  String password2="";

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
                                    "Rejestracja",
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
                              SizedBox(height: screenHeight*0.01),
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
                              SizedBox(height: screenHeight*0.01),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30
                                ),
                                child: SizedBox(
                                  width: screenWidth,
                                  child: const Text(
                                    'Email',
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
                                          return "Wpisz email!";
                                        }
                                        else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                                          return "Wpisz poprawny email!";
                                        }
                                        else {
                                          email=value;
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight*0.01),
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
                              SizedBox(height: screenHeight*0.01),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30
                                ),
                                child: SizedBox(
                                  width: screenWidth,
                                  child: const Text(
                                    'Powtórz hasło',
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
                                        if (value! != password) {
                                          return "Wpisane hasła nie są identyczne!";
                                        }
                                        else {
                                          password2=value;
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight*0.02),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: screenHeight*0.01
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      //TODO: send registration form
                                      registerUser(login, email, password);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFD0CECE),
                                      minimumSize: Size(screenWidth*0.9, screenHeight*0.11)
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Zarejestruj się',
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
                                    vertical: screenHeight*0.01
                                ),
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: SizedBox(
                                    width: screenWidth,
                                    child: const Text(
                                      'Powrót do ekranu logowania',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18
                                      ),
                                    ),
                                  ),
                                )
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

  registerUser(String login, String email, String password) async {
    try {
      var response = await http.post(Uri.parse('http://localhost:8080/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': login,
          'email': email,
          'password': password
        }),
      );

      if (response.statusCode == 200) {
        //TODO: add successful registration alert
        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return;
        Navigator.of(context).pushNamed('loginPage');
      }
      //TODO: handle other responses,
      //TODO: check if login is already taken
      //TODO: check if email is already taken
    }
    catch (e) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Rejestracja nie powiodło się'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Błąd serwera.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
      );
    }
  }
}