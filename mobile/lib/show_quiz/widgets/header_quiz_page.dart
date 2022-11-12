import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderQuizPage extends StatelessWidget {
  const HeaderQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Image.asset('assets/images/quiz.png', width: 50, height: 50),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Quiz', style: TextStyle(fontSize: 40), ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => context.go('/home'),
              child:
                  Image.asset('assets/images/close.png', width: 50, height: 50, alignment: Alignment.centerRight,),
            ),
          ),
        ],
      ),
    );
  }
}
