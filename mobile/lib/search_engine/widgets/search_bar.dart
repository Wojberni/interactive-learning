import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  final String _hintText = "Szukaj...";
  final Color _fillInputColor = const Color(0xFFB1FAFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            // validator: () => print("Lol"),
            onTap: () {
              FocusScope.of(context).unfocus();
              TextEditingController().clear();
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: _fillInputColor,
              hintText: _hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => print("clicked search button"),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
                decoration: BoxDecoration(
                  color: _fillInputColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset("assets/images/search_icon.png"),
                ),
              ),
          ),
        ),
      ]),
    );
  }
}
