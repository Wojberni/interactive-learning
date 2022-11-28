import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
  }) : super(key: key);

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final _fillInputColor = const Color(0xFF82E6FF);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                inputFormatters: inputFormatters,
                validator: (value) => validateInput(value),
                onTap: () {
                  FocusScope.of(context).unfocus();
                  TextEditingController().clear();
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: _fillInputColor,
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 13, horizontal: 15),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ]),
    );
  }

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pole nie może być puste';
    }
    return null;
  }
}
