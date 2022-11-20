import 'package:flutter/material.dart';

class HeartFavourite extends StatefulWidget {
  const HeartFavourite({super.key});

  @override
  State<HeartFavourite> createState() => _HeartFavouriteState();
}

class _HeartFavouriteState extends State<HeartFavourite> {
  var _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return _isFavourite
        ? ElevatedButton(
            onPressed: () => setState(() => _isFavourite = false),
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xFFECECEC)),
            ),
            child: Image.asset(
              'assets/images/unfilled_heart.png',
              width: 30,
              height: 30,
            ),
          )
        : ElevatedButton(
            onPressed: () => setState(() => _isFavourite = true),
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xFFECECEC)),
            ),
            child: Image.asset(
              'assets/images/filled_heart.png',
              width: 30,
              height: 30,
            ),
          );
  }
}
