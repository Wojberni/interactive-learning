import 'package:flutter/material.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset('assets/images/logo.png',
                width: 60, height: 60),
          ),
          const Text(
            "Aplikacja do nauki",
            style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                backgroundColor: Colors.white,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
