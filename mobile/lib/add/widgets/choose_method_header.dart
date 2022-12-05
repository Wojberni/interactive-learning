import 'package:flutter/material.dart';

class ChooseMethodHeader extends StatelessWidget {
  const ChooseMethodHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/add_method.png',
            width: 50,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Wybierz metodę', style: TextStyle(fontSize: 32)),
          ),
        ],
      ),
    );
  }
}
