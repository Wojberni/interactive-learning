import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body:  SafeArea(
              child: Center(
                  child: Container (
                      color: const Color(0xFF090546),
                      child: Center(
                        child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top:20),
                                child: Text(
                                  "Logowanie",
                                  style: TextStyle(
                                        fontSize: 36,
                                        color: Colors.white
                                  ),
                                ),
                              ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: SizedBox(
                                  height: 5,
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  child: const DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                    ),
                                  ),
                              ),
                               ),
                              const SizedBox(height: 70),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                    'Login',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 38
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 1
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF39D3EF),
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Wpisz swój login',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15
                                ),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                    'Hasło',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 38
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 1
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF39D3EF),
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Wpisz swoje hasło',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFD0CECE),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Zaloguj się',
                                      style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFD0CECE),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Rejestracja',
                                      style: TextStyle(
                                            fontSize: 32,
                                            color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
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
                            ]),
                      )
                  )
              ),
            )
        )
    );
  }
}