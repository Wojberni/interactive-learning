import 'package:flutter/material.dart';

class SearchEngineHeader extends StatelessWidget {
  const SearchEngineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Image.asset('assets/images/search_engine.png', width: 50, height: 50,),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Wyszukiwarka', style: TextStyle(fontSize: 40),),
          ),
        ],
      ),
    );
  }
  
}