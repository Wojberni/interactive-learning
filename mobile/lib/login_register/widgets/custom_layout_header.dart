import 'package:flutter/material.dart';

class CustomHeaderLoginRegister extends StatelessWidget {

  const CustomHeaderLoginRegister(this.header, {super.key});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Center(
            child: Text(
              header,
              style: const TextStyle(
                  fontSize: 36, color: Colors.white),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 5,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}