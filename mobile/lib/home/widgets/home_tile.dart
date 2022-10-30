import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  const HomeTile(
      {super.key,
      required this.title,
      required this.color,
      required this.iconPath,
      required this.onTap});

  final String title;
  final Color color;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
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
      ),
    );
  }
}
