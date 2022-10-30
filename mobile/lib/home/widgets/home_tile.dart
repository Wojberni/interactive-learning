import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  const HomeTile(
      {super.key,
      required this.title,
      required this.color,
      required this.iconPath});

  final String title;
  final Color color;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
          // SvgPicture.asset(iconPath, width: 50, height: 50),
          Image.asset(iconPath, width: 100, height: 100),
        ],
      ),
    );
  }
}
