import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.secret = false,
  }) : super(key: key);

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final _fillInputColor = const Color(0xFF82E6FF);
  final bool secret;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(children: [
        Text(
          hintText,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextFormField(
            inputFormatters: inputFormatters,
            validator: validator,
            obscureText: secret,
            onTap: () {
              FocusScope.of(context).unfocus();
              TextEditingController().clear();
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: _fillInputColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ]),
    );
  }
}
