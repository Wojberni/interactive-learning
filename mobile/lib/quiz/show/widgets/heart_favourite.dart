import 'package:flutter/material.dart';

class HeartFavourite extends StatelessWidget {
  final bool isFavourite;

  const HeartFavourite({super.key, required this.isFavourite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      color: const Color(0xFFECECEC),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFECECEC),
      ),
      child: Image.asset(
        isFavourite
            ? 'assets/images/unfilled_heart.png'
            : 'assets/images/filled_heart.png',
        width: 30,
        height: 30,
      ),
    );
  }
}
