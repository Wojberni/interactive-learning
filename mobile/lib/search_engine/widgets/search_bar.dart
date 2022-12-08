import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../common/providers/search_quiz_provider.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  final String _hintText = "Szukaj...";
  final Color _fillInputColor = const Color(0xFFB1FAFF);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
              onSaved: (value) {
                context.read<SearchScreenProvider>().query = value!;
              },
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
        ),
        GestureDetector(
          onTap: () => _saveInput(),
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

  _saveInput(){
    _formKey.currentState!.save();
  }
}
