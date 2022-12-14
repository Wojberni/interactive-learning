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
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(
          hintText,
          textAlign: TextAlign.left,
          textWidthBasis: TextWidthBasis.parent,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.normal,
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
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 13, horizontal: 15),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
