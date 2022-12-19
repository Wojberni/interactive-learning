import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartFavourite extends StatelessWidget {
  final bool isFavourite;

  const HeartFavourite({super.key, required this.isFavourite});

  @override
  Widget build(BuildContext context) {
    return Icon(
            color: Colors.red,
            isFavourite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            size: 70);
  }
}
